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
#include <poll.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <linux/un.h>
#include <linux/usbdevice_fs.h>
#include <linux/version.h>
#if LINUX_VERSION_CODE > KERNEL_VERSION(2, 6, 20)
#include <linux/usb/ch9.h>
#else
#include <linux/usb_ch9.h>
#endif
#include <sys/time.h>
#include <stdarg.h>
#include "usb_linux.h"
extern uint32_t      inet_addr(const char *);

#define MAX_USBFS_BULK_IN_SIZE (4 * 1024)
#define MAX_USBFS_BULK_OUT_SIZE (16 * 1024)
#define EC20_MAX_INF 1
#define MKDEV(ma, mi) ((ma)<<8 | (mi))

int usbfs_flag = 0;

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
};

static struct quectel_usb_device quectel_9x07;
static int tcp_socket_fd = -1;

static inline int badname(const char *name) {
    while(*name) {
        if(!isdigit(*name++)) return 1;
    }
    return 0;
}

static int CreateDir(const char *sPathName) {
    char DirName[256];
    strcpy(DirName,sPathName);
    int  i,len = strlen(DirName);
    if(DirName[len-1]!='/')
        strcat(DirName, "/");
    len = strlen(DirName);

    for(i=1; i<len; i++) {
        if(DirName[i] == '/') {
            DirName[i] = 0;
            if(opendir(DirName)==0) {
                if(mkdir(DirName, 0755) == -1) {
                    dbg_time("mkdir %s\n",DirName);
                    return -1;
                }
            }
            DirName[i] = '/';
        }
    }
    return   0;
}

static int charsplit(const char *src, char* desc, int n, const char* splitStr) {
    char* p;
    char* p1;
    int len;

    len = strlen(splitStr);
    p = strstr((char*)src, splitStr);
    if(p == NULL)
        return -1;
    p1 = strstr(p, "\n");
    if(p1 == NULL)
        return -1;
    memset(desc, 0 ,n);
    memcpy(desc, p+len, p1-p-len);

    return 0;
}

int create_node(void) {
    const char *base = "/sys/bus/usb/devices";
    int n = 0;
    int fd = -1;
    DIR *busdir = NULL, *devdir = NULL;
    struct dirent *de = NULL;
    char busname[64], devname[64];
    char buf[256] = {0};
    char busnum[64], devnum[64], devmajor[64], devminor[64];
    char buspath[128], devpath[128];

    busdir = opendir(base);
    if (busdir == NULL)
        return -1;

    while ((de = readdir(busdir))) {
        sprintf(busname, "%s/%s", base, de->d_name);
        devdir = opendir(busname);
        if (devdir == NULL)
            continue;
        while((de = readdir(devdir))) {
            sprintf(devname, "%s/%s", busname, de->d_name);
            if (strstr(devname, "uevent") != NULL) {
                fd = open(devname, O_RDONLY);
                n = read(fd, buf, sizeof(buf));
                buf[n-1] = '\n';
                buf[n] = '\0';

                if ((strstr(buf, "PRODUCT=2c7c") || strstr(buf, "PRODUCT=5c6/9008")) && strstr(buf, "DEVTYPE=usb_device")) {
                    if (charsplit(buf, busnum, 64, "BUSNUM=") || charsplit(buf, devnum, 64, "DEVNUM=") ||
                            charsplit(buf, devmajor, 64, "MAJOR=") || charsplit(buf, devminor, 64, "MINOR=")) {
                        dbg_time("Split String Error!\n");
                        close(fd);
                        closedir(devdir);
                        closedir(busdir);

                        return -1;
                    }

                    memset(buspath, 0, sizeof(buspath));
                    memset(devpath, 0, sizeof(devpath));

                    sprintf(buspath, "/dev/bus/usb/%s", busnum);
                    sprintf(devpath, "/dev/bus/usb/%s/%s", busnum, devnum);

                    if (CreateDir(buspath)) {
                        dbg_time("Create %s failed!\n", buspath);
                        close(fd);
                        closedir(devdir);
                        closedir(busdir);
                    } else {
                        dbg_time("Create usbfs direcotry success!\n");

                        if (mknod(devpath, S_IFCHR|0666, MKDEV(atoi(devmajor), atoi(devminor)))) {
                            dbg_time("mknod for %s failed, MAJOR = %s, MINOR =%s, errno = %d(%s)\n", devpath, devmajor,devminor, errno, strerror(errno));

                        } else {
                            dbg_time("mknod for %s success, MAJOR = %s, MINOR = %s\n", devpath, devmajor, devminor);
                        }

                        if(!chmod(devpath, 0666))
                            dbg_time("chmod %s 0666 success\n", devpath);
                        else
                            dbg_time("chmod %s 0666 failed\n", devpath);

                    }

                    close(fd);
                    closedir(devdir);
                    closedir(busdir);
                    return 0;
                }
                close(fd);
            }
        }
        closedir(devdir);
    }
    closedir(busdir);

    return -1;
}

static void quectel_find_usb_device(struct quectel_usb_device *udev) {
    const char *base = "/dev/bus/usb";
    char busname[255+2], devname[255+2];
    DIR *busdir , *devdir ;
    struct dirent *de;
    int fd ;

    if (usbfs_flag) system("rm -rf /dev/bus");

    busdir = opendir(base);
    if (busdir == 0) {
        int ret = create_node();
        if (!ret) {
            usbfs_flag = 1;
            busdir = opendir(base);
        } else {
            return;
        }
    }

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
                    dbg_time("P: %s idVendor=%04x idProduct=%04x\n", devname, device->idVendor, device->idProduct);
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
                    if (bInterfaceNumber < EC20_MAX_INF) {
                        struct usb_endpoint_descriptor *endpoint = (struct usb_endpoint_descriptor *)h;

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
                } else {
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

static int usbfs_bulk_write(struct quectel_usb_device *udev, const void *data, int len, int timeout_msec, int need_zlp) {
    struct usbdevfs_urb bulk;
    struct usbdevfs_urb *urb = &bulk;
    int n = -1;
    int bInterfaceNumber = 0;

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

static int poll_wait(int poll_fd, short events, int timeout_msec) {
    struct pollfd pollfds[] = {{poll_fd, events, 0}};
    int ret = poll(pollfds, 1, timeout_msec);

    if (ret == 0) {//timeout
        dbg_time("poll_wait events=%s msec=%d timeout\n",
                 (events & POLLIN) ? "POLLIN" : "POLLOUT", timeout_msec);
        return ETIMEDOUT;
    } else if (pollfds[0].revents & (POLLERR | POLLHUP | POLLNVAL))
        return EIO;
    else if (pollfds[0].revents & (events))
        return 0;
    else
        return EIO;

    return EIO;
}

static int usbfs_bulk_read(struct quectel_usb_device *udev, void *pbuf, int len, int timeout) {
    struct usbdevfs_bulktransfer bulk;
    int n = -1;
    int bInterfaceNumber = 0;

    if (len < 512) {
        dbg_time("%s len=%d is too short\n", __func__, len);
        return 0;
    }

    bulk.ep = udev->bulk_ep_in[bInterfaceNumber];
    bulk.len = (len > MAX_USBFS_BULK_IN_SIZE) ? MAX_USBFS_BULK_IN_SIZE : len;
    bulk.data = (void *)pbuf;
    bulk.timeout = timeout;

    n = ioctl(udev->desc, USBDEVFS_BULK, &bulk);
    if( n <= 0 ) {
        if (errno == ETIMEDOUT) {
            dbg_time("inf[%d] ep_in %d/%d, errno = %d (%s), timeout=%d\n", bInterfaceNumber, n, bulk.len, errno, strerror(errno), timeout);
            n = 0;
        } else
            dbg_time("inf[%d] ep_in %d/%d, errno = %d (%s)\n", bInterfaceNumber, n, bulk.len, errno, strerror(errno));
    }

    return n ;
}

static int qtcp_connect(const char *port_name, int *idVendor, int *idProduct, int *interfaceNum) {
    int fd = -1;
    char *tcp_host = strdup(port_name);
    char *tcp_port = strchr(tcp_host, ':');
    struct sockaddr_in sockaddr;

    dbg_time("%s port_name = %s\n", __func__, port_name);

    if (tcp_port == NULL)
        return -1;

    *tcp_port++ = '\0';
    if (atoi(tcp_port) < 1 || atoi(tcp_port) > 0xFFFF)
        return -1;

    fd = socket(AF_INET, SOCK_STREAM, 0);

    if (fd <= 0) {
        dbg_time("Device could not be socket: Linux System Errno: %s\n", strerror (errno));
        return -1;
    }

    memset(&sockaddr, 0, sizeof(sockaddr));
    sockaddr.sin_family = AF_INET;
    sockaddr.sin_addr.s_addr = inet_addr(tcp_host);
    sockaddr.sin_port = htons(atoi(tcp_port));

    free(tcp_host);
    if (connect(fd, (struct sockaddr *) &sockaddr, sizeof(sockaddr)) < 0) {
        close(fd);
        dbg_time("Device could not be connect: Linux System Errno: %s\n", strerror (errno));
        return -1;
    }

    //block read, untill usb2tcp tell me the usb device information
    read(fd, idVendor, sizeof(int));
    read(fd, idProduct, sizeof(int));
    read(fd, interfaceNum, sizeof(int));
    dbg_time("idVendor=%04x, idProduct=%04x, interfaceNum=%d\n", *idVendor, *idProduct, *interfaceNum);

    return fd;
}

static int qtcp_write(int fd, void*pbuf, int size, int timeout_msec) {
    typedef struct {
        int tag;
        int length;
        int value[];
    } TLV;

    TLV tlv = {0x12345678, size};
    int cur = 0;
    int len;

    len = write(fd, &tlv, sizeof(tlv));
    if (len != sizeof(tlv)) {
        dbg_time("%s write=%d, errno: %d (%s)\n", __func__, len, errno, strerror(errno));
        return 0;
    }

    while (cur < size) {
        if (poll_wait(fd, POLLOUT, timeout_msec))
            break;

        len = write(fd, pbuf+cur, size-cur);
        if (len > 0) {
            cur += len;
        } else {
            dbg_time("%s write=%d, errno: %d (%s)\n", __func__, len, errno, strerror(errno));
            break;
        }
    }

    if (cur != size) {
        dbg_time("%s cur=%d, size=%d\n", __func__, fd, cur, size);
    }

    return cur;
}

void *qusb_noblock_open(const char *port_name, int *idVendor, int *idProduct, int *interfaceNum) {
    struct termios ios;
    int retval;
    int fd = -1;
    struct quectel_usb_device *udev = &quectel_9x07;

    *idVendor = *idProduct = *interfaceNum = 0;
    dbg_time("%s port_name = %s\n", __func__, port_name);

    tcp_socket_fd = -1;
    if (port_name[0] == '/') {
        memset(udev, 0, sizeof(struct quectel_usb_device));
        quectel_find_usb_device(udev);

        if (udev->desc <= 0) {
            dbg_time("Fail quectel_find_usb_device\n");
            return NULL;
        }

        *idVendor =udev->idVendor;
        *idProduct = udev->idProduct;
        *interfaceNum = udev->bNumInterfaces;

        if (!access(port_name, R_OK)) {
            fd = open (port_name, O_RDWR | O_SYNC);

            if (fd <= 0) {
                dbg_time("Device could not be open: Linux System Errno: %s", strerror (errno));
                return NULL;
            }

            retval = tcgetattr (fd, &ios);
            if (-1 == retval) {
                dbg_time("ermio settings could not be fetched Linux System Error:%s", strerror (errno));
                return NULL;
            }

            cfmakeraw (&ios);
            cfsetispeed(&ios, B115200);
            cfsetospeed(&ios, B115200);

            retval = tcsetattr (fd, TCSANOW, &ios);
            if (-1 == retval) {
                dbg_time("Device could not be configured: Linux System Errno: %s", strerror (errno));
            }
            udev->ttyfd = fd;
            fcntl(fd, F_SETFL, fcntl(fd,F_GETFL) | O_NONBLOCK);
            return udev;
        } else if (udev->desc) {
            int bInterfaceNumber = 0;

            retval = ioctl(udev->desc, USBDEVFS_CLAIMINTERFACE, &bInterfaceNumber);
            if(retval != 0) {
                dbg_time("fail to claim interface %d, errno: %d (%s)\n", bInterfaceNumber, errno, strerror(errno));
                return NULL;
            }

            udev->ttyfd = -1;
            return udev;
        }
    } else {
        fd = qtcp_connect(port_name, idVendor, idProduct, interfaceNum);
        if (fd > 0) {
            tcp_socket_fd = fd;
            fcntl(fd, F_SETFL, fcntl(fd,F_GETFL) | O_NONBLOCK);
            return &tcp_socket_fd;
        }
    }

    return NULL;
}

int qusb_noblock_close(void *handle) {
    struct quectel_usb_device *udev = &quectel_9x07;

    if (handle == &tcp_socket_fd) {
        close(tcp_socket_fd);
        tcp_socket_fd = -1;
    }
    if (handle == udev && udev->ttyfd > 0) {
        close(udev->ttyfd);
        close(udev->desc);
    } else if (handle == udev && udev->desc > 0) {
        int bInterfaceNumber = 0;
        ioctl(udev->desc, USBDEVFS_RELEASEINTERFACE, &bInterfaceNumber);
        close(udev->desc);
    }
    memset(udev, 0, sizeof(*udev));

    return 0;
}

int qusb_noblock_read(const void *handle, void *pbuf, int max_size, int min_size, int timeout_msec) {
    struct quectel_usb_device *udev = &quectel_9x07;
    int cur = 0;

    if (min_size == 0)
        min_size = 1;
    if (timeout_msec == 0)
        timeout_msec = 3000;

#if 0 //depend on your worst net speed
    if (handle == &tcp_socket_fd) {
        if (timeout_msec > 1000) //before sahala&firebose, we allow read timeout occurs
            timeout_msec = 120*1000;
    }
#endif

    while (cur < min_size) {
        int len = 0;

        if (handle == &tcp_socket_fd) {
            if (poll_wait(tcp_socket_fd, POLLIN, timeout_msec))
                break;
            len = read(tcp_socket_fd, pbuf+cur, max_size-cur);
        } else if (handle == udev && udev->ttyfd > 0) {
            if (poll_wait(udev->ttyfd, POLLIN, timeout_msec))
                break;
            len = read(udev->ttyfd, pbuf+cur, max_size-cur);
        } else if (handle == udev && udev->desc > 0) {
            len = usbfs_bulk_read(udev, pbuf+cur, max_size-cur, timeout_msec);
        } else {
            break;
        }

        if (len > 0) {
            cur += len;
        } else {
            dbg_time("%s read=%d, errno: %d (%s)\n", __func__, len, errno, strerror(errno));
            break;
        }
    }

    if (cur < min_size) {
        dbg_time("%s cur=%d, min_size=%d\n", __func__, cur, min_size);
    }

    return cur;
}

int qusb_noblock_write(const void *handle, void *pbuf, int max_size, int min_size, int timeout_msec, int need_zlp) {
    struct quectel_usb_device *udev = &quectel_9x07;
    int cur = 0;

    if (min_size == 0)
        min_size = 1;
    if (timeout_msec == 0)
        timeout_msec = 3000;

#if 0 //depend on your worst net speed
    if (handle == &tcp_socket_fd) {
        timeout_msec = 120*1000;
    }
#endif

    while (cur < min_size) {
        int len = 0;

        if (handle == &tcp_socket_fd) {
            if (poll_wait(tcp_socket_fd, POLLOUT, timeout_msec))
                break;
            len = qtcp_write(tcp_socket_fd, pbuf+cur, max_size-cur, timeout_msec);
        } else if (handle == udev && udev->ttyfd > 0) {
            if (poll_wait(udev->ttyfd, POLLOUT, timeout_msec))
                break;
            len = write(udev->ttyfd, pbuf+cur, max_size-cur);
        } else if (handle == udev && udev->desc > 0) {
            len = usbfs_bulk_write(udev, pbuf+cur, max_size-cur, timeout_msec, need_zlp);
        } else {
            break;
        }

        if (len > 0) {
            cur += len;
        } else {
            dbg_time("%s write=%d, errno: %d (%s)\n", __func__, len, errno, strerror(errno));
            break;
        }
    }

    if (cur < min_size) {
        dbg_time("%s cur=%d, min_size=%d\n", __func__, cur, min_size);
    }

    return cur;
}

int qfile_find_xmlfile(const char *dir, const char *prefix, char** xmlfile) {
    DIR *pdir;
    struct dirent* ent = NULL;
    pdir = opendir(dir);

    if(pdir) {
        while((ent = readdir(pdir)) != NULL) {
            if(!strncmp(ent->d_name, prefix, strlen(prefix))) {
                *xmlfile = strdup(ent->d_name);
                closedir(pdir);
                return 0;
            }
        }

    } else {
        return 1;
    }
    return 1;
}

static const char * firehose_get_time(void) {
    static char time_buf[50];
    struct timeval  tv;
    static int s_start_msec = -1;
    int now_msec, cost_msec;

    gettimeofday (&tv, NULL);
    now_msec = tv.tv_sec * 1000;
    now_msec += (tv.tv_usec + 500) / 1000;

    if (s_start_msec == -1) {
        s_start_msec = now_msec;
    }

    cost_msec = now_msec - s_start_msec;

    sprintf(time_buf, "[%03d.%03d]", cost_msec/1000, cost_msec%1000);
    return time_buf;
}

void dbg_time (const char *fmt, ...) {
    va_list args;
    va_start(args, fmt);
    static char line[2048];
    snprintf(line, sizeof(line), "%s ", firehose_get_time());
    vsnprintf(line + strlen(line), sizeof(line) - strlen(line), fmt, args);
    fprintf(stdout, "%s", line);
    fflush(stdout);
}
