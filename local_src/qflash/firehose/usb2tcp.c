#include <stdio.h>
#include <ctype.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <time.h>
#include <termios.h>
#include <dirent.h>
#include <pthread.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <sys/poll.h>
#include <netinet/in.h>
#include <linux/un.h>
#include <linux/usbdevice_fs.h>
#include <linux/version.h>
#if LINUX_VERSION_CODE > KERNEL_VERSION(2, 6, 20)
#include <linux/usb/ch9.h>
#else
#include <linux/usb_ch9.h>
#endif
//#include <asm/byteorder.h>

#define MIN(a,b)	 ((a) < (b)? (a) : (b))
#define dprintf printf
#define dbg_time dprintf

#define MAX_USBFS_BULK_IN_SIZE (4 * 1024)
#define MAX_USBFS_BULK_OUT_SIZE (16 * 1024)
#define EC20_MAX_INF 1

struct quectel_usb_device {
    char devname[64];
    int desc;
    int ttyfd;
    int idVendor;
    int idProduct;
    uint8_t bNumInterfaces;
    uint8_t intr_ep[EC20_MAX_INF];
    uint8_t bulk_ep_in[EC20_MAX_INF];
    uint8_t bulk_ep_out[EC20_MAX_INF];
    int wMaxPacketSize[EC20_MAX_INF];
    int control[EC20_MAX_INF][2];
    pthread_t thread_id[EC20_MAX_INF];
};

static struct quectel_usb_device quectel_9x07;

static int noblock_full_read(int fd, void *pbuf, ssize_t size) {
    ssize_t cur = 0;

    while (cur < size) {
        ssize_t ret = read(fd, pbuf+cur, size-cur);

        if (ret > 0)
            cur += ret;
        else if (ret < 0 && errno == EAGAIN) {
            struct pollfd pollfds[] = {{fd, POLLIN, 0}};
            poll(pollfds, 1, -1);
            if (pollfds[0].revents & (POLLERR | POLLHUP | POLLNVAL))
                break;
        } else {
            dprintf("fd=%d read=%zd, errno: %d (%s)\n", fd, ret, errno, strerror(errno));
            break;
        }
    }

    if (cur != size) {
        dprintf("%s fd=%d cur=%zd, size=%zd\n", __func__, fd, cur, size);
    }

    return cur;
}

static ssize_t noblock_full_write(int fd, const void *pbuf, ssize_t size) {
    ssize_t cur = 0;

    while (cur < size) {
        ssize_t ret = write(fd, pbuf+cur, size-cur);
        if (ret > 0)
            cur += ret;
        else if (ret <= 0 && errno == EAGAIN) {
            struct pollfd pollfds[] = {{fd, POLLOUT, 0}};
            poll(pollfds, 1, -1);
            if (pollfds[0].revents & (POLLERR | POLLHUP | POLLNVAL))
                break;
        } else {
            dprintf("fd=%d write=%zd, errno: %d (%s)\n", fd, ret, errno, strerror(errno));
            break;
        }
    }

    if (cur != size) {
        dprintf("%s fd=%d cur=%zd, size=%zd\n", __func__, fd, cur, size);
    }

    return cur;
}


static inline int badname(const char *name) {
    while(*name) {
        if(!isdigit(*name++)) return 1;
    }
    return 0;
}

static void quectel_find_usb_device(struct quectel_usb_device *udev) {
    const char *base = "/dev/bus/usb";
    char busname[255+2], devname[255+2];
    DIR *busdir , *devdir ;
    struct dirent *de;
    int fd ;

    busdir = opendir(base);
    if (busdir == 0) return;

    while ((de = readdir(busdir)) != 0) {
        if(badname(de->d_name)) continue;

        sprintf(busname, "%s/%s", base, de->d_name);
        devdir = opendir(busname);
        if(devdir == 0) continue;

        while ((de = readdir(devdir))) {
            unsigned char devdesc[1024];
            size_t desclength;
            size_t len;
            __u8 bInterfaceNumber = 0;

            if (badname(de->d_name)) continue;
            sprintf(devname, "%s/%s", busname, de->d_name);

            if ((fd = open(devname, O_RDWR | O_NOCTTY)) < 0) {
                continue;
            }

            desclength = read(fd, devdesc, sizeof(devdesc));

            len = 0;
            while (len < desclength) {
                struct usb_descriptor_header *h = (struct usb_descriptor_header *)(&devdesc[len]);

                if (h->bLength == sizeof(struct usb_device_descriptor) && h->bDescriptorType == USB_DT_DEVICE) {
                    struct usb_device_descriptor *device = (struct usb_device_descriptor *)h;

                    if (device->idVendor == 0x2c7c || (device->idVendor == 0x05c6 && device->idProduct == 0x9008)) {
                        udev->idVendor = device->idVendor;
                        udev->idProduct = device->idProduct;
                    } else {
                        break;
                    }
                    dbg_time("D: %s idVendor=%04x idProduct=%04x\n", devname, device->idVendor, device->idProduct);
                } else if (h->bLength == sizeof(struct usb_config_descriptor) && h->bDescriptorType == USB_DT_CONFIG) {
                    struct usb_config_descriptor *config = (struct usb_config_descriptor *)h;

                    dbg_time("C: %s bNumInterfaces: %d\n", devname, config->bNumInterfaces);
                    udev->bNumInterfaces = config->bNumInterfaces;
                } else if (h->bLength == sizeof(struct usb_interface_descriptor) && h->bDescriptorType == USB_DT_INTERFACE) {
                    struct usb_interface_descriptor *interface = (struct usb_interface_descriptor *)h;

                    dbg_time("I: If#= %d Alt= %d #EPs= %d Cls=%02x Sub=%02x Prot=%02x\n",
                             interface->bInterfaceNumber, interface->bAlternateSetting, interface->bNumEndpoints,
                             interface->bInterfaceClass, interface->bInterfaceSubClass, interface->bInterfaceProtocol);
                    bInterfaceNumber = interface->bInterfaceNumber;
                } else if (h->bLength == USB_DT_ENDPOINT_SIZE && h->bDescriptorType == USB_DT_ENDPOINT) {
                    struct usb_endpoint_descriptor *endpoint = (struct usb_endpoint_descriptor *)h;

                    if (bInterfaceNumber < EC20_MAX_INF) {
                        dbg_time("E: Ad=%02x Atr=%02x MxPS= %d Ivl=%dms\n",
                                 endpoint->bEndpointAddress, endpoint->bmAttributes, endpoint->wMaxPacketSize, endpoint->bInterval);

                        if ((endpoint->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) == USB_ENDPOINT_XFER_BULK) {
                            if (endpoint->bEndpointAddress & USB_ENDPOINT_DIR_MASK)
                                udev->bulk_ep_in[bInterfaceNumber] = endpoint->bEndpointAddress;
                            else
                                udev->bulk_ep_out[bInterfaceNumber] = endpoint->bEndpointAddress;
                            udev->wMaxPacketSize[bInterfaceNumber] = endpoint->wMaxPacketSize;
                        } else if ((endpoint->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) == USB_ENDPOINT_XFER_INT) {
                            udev->intr_ep[bInterfaceNumber] = endpoint->bEndpointAddress;
                        }
                    }
                } else if ((h->bLength == 4 || h->bLength == 5)  && h->bDescriptorType == USB_DT_CS_INTERFACE) {

                } else {
                    dbg_time("unknow bLength=%d bDescriptorType=%d\n", h->bLength, h->bDescriptorType);
                    break;
                }

                len += h->bLength;
            }

            if (len == desclength) {
                strcpy(udev->devname, devname);
                udev->desc = fd;
                break;
            }

            close(fd);
        } // end of devdir while

        closedir(devdir);

        if (udev->desc) {
            break;
        }
    } //end of busdir while

    closedir(busdir);
}

static int usbfs_bulk_write(struct quectel_usb_device *udev, int bInterfaceNumber, const void *data, int len, int need_zlp) {
    struct usbdevfs_urb bulk;
    struct usbdevfs_urb *urb = &bulk;
    int n = -1;

    //if (urb->type == 0)
    {
        memset(urb, 0, sizeof(struct usbdevfs_urb));
        urb->type = USBDEVFS_URB_TYPE_BULK;
        urb->endpoint = udev->bulk_ep_out[bInterfaceNumber];
    }

    urb->status = -1;
    urb->buffer = (void *)data;
    urb->buffer_length = (len > MAX_USBFS_BULK_OUT_SIZE) ? MAX_USBFS_BULK_OUT_SIZE : len;
    urb->usercontext = urb;

    if ((len <= MAX_USBFS_BULK_OUT_SIZE) && need_zlp && (len%512) == 0) {
        //dbg_time("USBDEVFS_URB_ZERO_PACKET\n");
#ifndef USBDEVFS_URB_ZERO_PACKET
#define USBDEVFS_URB_ZERO_PACKET	0x40
#endif
        urb->flags = USBDEVFS_URB_ZERO_PACKET;
    } else {
        urb->flags = 0;
    }

    do {
        n = ioctl(udev->desc, USBDEVFS_SUBMITURB, urb);
    } while((n < 0) && (errno == EINTR));

    if (n != 0) {
        dbg_time("inf[%d] USBDEVFS_SUBMITURB %d/%d, errno = %d (%s)\n", bInterfaceNumber, n, urb->buffer_length, errno, strerror(errno));
        return -1;
    }

    do {
        urb = NULL;
        n = ioctl(udev->desc, USBDEVFS_REAPURB, &urb);
    } while((n < 0) && (errno == EINTR));

    if (n != 0) {
        dbg_time("inf[%d] ep_out %d/%d, errno = %d (%s)\n", bInterfaceNumber, n, urb->buffer_length, errno, strerror(errno));
    }

    //dbg_time("[ urb @%p status = %d, actual = %d ]\n", urb, urb->status, urb->actual_length);

    if (urb && urb->status == 0 && urb->actual_length)
        return urb->actual_length;

    return -1;
}

static int usbfs_bulk_read(struct quectel_usb_device *udev, int bInterfaceNumber, const void *data, int len) {
    struct usbdevfs_bulktransfer bulk;
    int n = -1;

    bulk.ep = udev->bulk_ep_in[bInterfaceNumber];
    bulk.len = (len > MAX_USBFS_BULK_IN_SIZE) ? MAX_USBFS_BULK_IN_SIZE : len;;
    bulk.data = (void *)data;
    bulk.timeout = 0;

    n = ioctl(udev->desc, USBDEVFS_BULK, &bulk);
    if( n < 0 ) {
        if (errno != ESHUTDOWN)
            dbg_time("inf[%d] ep_in %d/%d, errno = %d (%s)\n", bInterfaceNumber, n, bulk.len, errno, strerror(errno));
    }

    return n ;
}

static void* usb_bulk_read_thread(void* arg) {
    struct quectel_usb_device *udev = (struct quectel_usb_device *)arg;
    void *buf = malloc(MAX_USBFS_BULK_IN_SIZE);
    int fd = udev->control[0][1];

    if (buf == NULL)
        return NULL;

    while(udev->desc) {
        int count = usbfs_bulk_read(udev, 0, buf, MAX_USBFS_BULK_IN_SIZE);

        if (count > 0 && udev->desc) {
            count = write(fd, buf, count);
        } else if (count < 0) {
            close(fd);
            break;
        }
    }

    free(buf);
    return NULL;
}

static int qusb_open(const char *port_name) {
    struct termios ios;
    int retval;
    int fd = -1;
    struct quectel_usb_device *udev = &quectel_9x07;

    dbg_time("%s port_name = %s\n", __func__, port_name);

    if (port_name[0] == '/') {
        if (!access(port_name, R_OK)) {
            fd = open (port_name, O_RDWR | O_SYNC);

            if (fd <= 0) {
                dbg_time("Device could not be open: Linux System Errno: %s", strerror (errno));
                return -1;
            }

            retval = tcgetattr (fd, &ios);
            if (-1 == retval) {
                dbg_time("ermio settings could not be fetched Linux System Error:%s", strerror (errno));
                return -1;
            }

            cfmakeraw (&ios);
            cfsetispeed(&ios, B115200);
            cfsetospeed(&ios, B115200);

            retval = tcsetattr (fd, TCSANOW, &ios);
            if (-1 == retval) {
                dbg_time("Device could not be configured: Linux System Errno: %s", strerror (errno));
            }
            udev->ttyfd = fd;
        } else if (udev->desc) {
            pthread_attr_t usb_thread_attr;
            int bInterfaceNumber = 0;

            retval = ioctl(udev->desc, USBDEVFS_CLAIMINTERFACE, &bInterfaceNumber);
            if(retval != 0) {
                dbg_time("fail to claim interface %d, errno: %d (%s)\n", bInterfaceNumber, errno, strerror(errno));
                return -1;
            }

            pthread_attr_init(&usb_thread_attr);
            pthread_attr_setdetachstate(&usb_thread_attr, PTHREAD_CREATE_DETACHED);

            socketpair(AF_LOCAL, SOCK_STREAM, 0, udev->control[bInterfaceNumber]);
            pthread_create(&udev->thread_id[bInterfaceNumber], &usb_thread_attr, usb_bulk_read_thread, (void*)udev);

            fd = udev->control[bInterfaceNumber][0];
        }
    }

    return fd;
}

static int qusb_close(int fd) {
    struct quectel_usb_device *udev = &quectel_9x07;

    if (udev->ttyfd > 0) {
        close(udev->ttyfd);
        close(udev->desc);
    } else if (udev->desc > 0) {
        int bInterfaceNumber = 0;
        ioctl(udev->desc, USBDEVFS_RELEASEINTERFACE, &bInterfaceNumber);
        close(udev->desc);
        close(fd);
        pthread_join(udev->thread_id[bInterfaceNumber], NULL);
    }
    memset(udev, 0, sizeof(*udev));

    return 0;
}

ssize_t qusb_read(int fd, void* pbuf, size_t size) {
    return read(fd, pbuf, size);
}

static ssize_t qusb_write(int fd, const void*pbuf, size_t size, int need_zlp) {
    struct quectel_usb_device *udev = &quectel_9x07;

    if (udev->ttyfd == fd)
        return write(udev->ttyfd, pbuf, size);
    else if (udev->desc > 0)
        return usbfs_bulk_write(udev, 0,  pbuf, size, need_zlp);
    else
        return 0;
}

static int qusb_find_quectel_9x07(const char *port_name, int *idVendor, int *idProduct, int *interfaceNum) {
    struct quectel_usb_device *udev = &quectel_9x07;

    *idVendor = *idProduct = *interfaceNum = 0;
    if (udev->desc > 0)
        close(udev->desc > 0);
    memset(udev, 0, sizeof(*udev));

    if (port_name[0] == '/') {
        quectel_find_usb_device(udev);
        if (udev->desc) {
            *idVendor =udev->idVendor;
            *idProduct = udev->idProduct;
            *interfaceNum = udev->bNumInterfaces;
            return 1;
        }
    }

    dbg_time("Error: %s\n", __func__);
    return 0;
}

static int create_tcp_server(int socket_port) {
    int sockfd = -1;
    int reuse_addr = 1;
    struct sockaddr_in sockaddr;

    dprintf("%s tcp_port=%d\n", __func__, socket_port);
    /*Create server socket*/
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd <= 0)
        return sockfd;

    memset(&sockaddr, 0, sizeof(sockaddr));
    sockaddr.sin_family = AF_INET;
    sockaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    sockaddr.sin_port = htons(socket_port);

    setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &reuse_addr,sizeof(reuse_addr));
    if (bind(sockfd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
        close(sockfd);
        dprintf("%s bind %d errno: %d (%s)\n", __func__, socket_port, errno, strerror(errno));
        return -1;
    }

    return sockfd;
}

static int wait_client_connect(int server_fd) {
    int client_fd = -1;
    unsigned char addr[128];
    socklen_t alen = sizeof(addr);

    dprintf("%s\n", __func__);
    listen(server_fd, 1);
    client_fd = accept(server_fd, (struct sockaddr *)addr, &alen);
    if (client_fd <= 0)
        return client_fd;

    return client_fd;
}

int main(int argc, char *argv[]) {
    const char *dm_port = "/dev/ttyUSB0";
    int tcp_port = 9008;
    void *pbuf = malloc(MAX_USBFS_BULK_OUT_SIZE);
    int server_fd = -1, client_fd = -1, usb_fd = -1, size = -1;
    struct quectel_usb_device *udev = &quectel_9x07;
    int idVendor = 0, idProduct = 0, interfaceNum = 0;

    if (pbuf == NULL)
        return -1;

    server_fd  = create_tcp_server(tcp_port);
    dprintf("server_fd=%d\n", server_fd);
    if (server_fd <= 0) {
        dprintf("Fail create_tcp_server\n");
        goto _out;
    }

    while (1) {
        if (client_fd <= 0) {
            client_fd = wait_client_connect(server_fd);
            dprintf("client_fd=%d\n", client_fd);
            if (client_fd < 0) {
                dprintf("Fail wait_client_connect\n");
                goto _out;
            }
        }

        //after long time wait tcp client connect, usb maybe had disconnect, so to check it
        if (usb_fd > 0 && access(udev->devname, R_OK)) {
            qusb_close(usb_fd);
            usb_fd = -1;
        }

        //wait usb connect
        while (usb_fd <= 0) {
            qusb_find_quectel_9x07(dm_port, &idVendor, &idProduct, &interfaceNum);
            if (idVendor == 0x0000) {
                dprintf("Fail qusb_find_ec20\n");
                sleep(1);
                continue;
            }

            dprintf("idVendor=%04X, idProduct=%04X, interfaceNum=%d\n", idVendor, idProduct, interfaceNum);
            if (udev->idVendor == 0x05C6 && udev->idProduct == 0x9008 && !access(dm_port, R_OK)) {
                dprintf("Fail 05C6&9008 should not register to %s\n", dm_port);
                goto _out;
            }

            usb_fd = qusb_open(dm_port);
            dprintf("usb_fd =%d\n", usb_fd);
        }

        write(client_fd, &idVendor, sizeof(int));
        write(client_fd, &idProduct, sizeof(int));
        write(client_fd, &interfaceNum, sizeof(int));

        fcntl(usb_fd, F_SETFL, fcntl(usb_fd,F_GETFL) | O_NONBLOCK);
        fcntl(client_fd, F_SETFL, fcntl(client_fd,F_GETFL) | O_NONBLOCK);

        while (usb_fd > 0 && client_fd > 0) {
            struct pollfd pollfds[] = {{usb_fd, POLLIN, 0}, {client_fd, POLLIN, 0}};
            int ne, ret, nevents = sizeof(pollfds)/sizeof(pollfds[0]);
            int client_hangup = 0, usb_hangup = 0;

            do {
                ret = poll(pollfds, nevents,  -1);
            } while (ret < 0 && errno == EINTR);


            if (ret <= 0) {
                dprintf("%s poll=%d, errno: %d (%s)\n", __func__, ret, errno, strerror(errno));
                usb_hangup = 1;
                goto _hangup;
            }


            if (pollfds[0].revents & (POLLERR | POLLHUP | POLLNVAL)) {
                dprintf("%s poll usb_fd = %d, revents = %04x\n", __func__, usb_fd, pollfds[0].revents);
                usb_hangup = 1;
                goto _hangup;
            }


            if (pollfds[1].revents & (POLLERR | POLLHUP | POLLNVAL)) {
                dprintf("%s poll client_fd = %d, revents = %04x\n", __func__, client_fd, pollfds[1].revents);
                client_hangup = 1;
                goto _hangup;
            }

            for (ne = 0; ne < nevents; ne++) {
                int fd = pollfds[ne].fd;

                if ((pollfds[ne].revents & POLLIN) == 0)
                    continue;

                if (fd == usb_fd) {
                    size = qusb_read(usb_fd, pbuf, MAX_USBFS_BULK_IN_SIZE);
                    if (size <= 0) {
                        dprintf("usb_fd=%d read=%d, errno: %d (%s)\n", fd, size, errno, strerror(errno));
                        usb_hangup = 1;
                        goto _hangup;;
                    }

                    if (size != noblock_full_write(client_fd, pbuf, size)) {
                        client_hangup = 1;
                        goto _hangup;
                        break;
                    }
                } else if (fd == client_fd) {
                    typedef struct {
                        int tag;
                        int length;
                        int value[];
                    } TLV;
                    TLV tlv = {0x12345678, 0};

                    size = noblock_full_read(client_fd, &tlv, sizeof(tlv));
                    if (size !=  sizeof(tlv)) {
                        dprintf("client_fd=%d read=%d, errno: %d (%s)\n", fd, size, errno, strerror(errno));
                        client_hangup = 1;
                        goto _hangup;
                    }

                    if (tlv.tag != 0x12345678) {
                        break;
                    }

                    size = tlv.length;
                    if (size != noblock_full_read(client_fd, pbuf, size)) {
                        client_hangup = 1;
                        goto _hangup;
                        break;
                    }
                    qusb_write(usb_fd, pbuf, size, 1);
                }
            }

_hangup:
            if (usb_hangup) {
                if (usb_fd > 0) {
                    qusb_close(usb_fd);
                    usb_fd = -1;
                }
                if (client_fd > 0) {
                    close(client_fd);
                    client_fd = -1;
                }
                sleep(1); //wait usb disconnect and re-connect
            }
            if (client_hangup) {
                if (client_fd > 0) {
                    close(client_fd);
                    client_fd = -1;
                }
            }
        }
    }

_out:
    free(pbuf);
    return 0;
}
