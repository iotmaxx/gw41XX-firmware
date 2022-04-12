#include "usb_linux.h"

/*
[PATCH 3.10 27/54] usb: xhci: Add support for URB_ZERO_PACKET to bulk/sg transfers
https://www.spinics.net/lists/kernel/msg2100618.html

commit 4758dcd19a7d9ba9610b38fecb93f65f56f86346
Author: Reyad Attiyat <reyad.attiyat@gmail.com>
Date:   Thu Aug 6 19:23:58 2015 +0300

    usb: xhci: Add support for URB_ZERO_PACKET to bulk/sg transfers

    This commit checks for the URB_ZERO_PACKET flag and creates an extra
    zero-length td if the urb transfer length is a multiple of the endpoint's
    max packet length.
*/
unsigned qusb_zlp_mode = 1; //MT7621 donot support USB ZERO PACKET
int sahara_main(const char *firehose_dir, void *usb_handle);
int firehose_main (const char *firehose_dir, void *usb_handle, unsigned qusb_zlp_mode);

const char* program_name = NULL;

//process vals
static long long all_bytes_to_transfer = 0;	//need transfered
static long long transfer_bytes = 0;		//transfered bytes;

#define error_return()  do {dbg_time("%s %s %d fail\n", __FILE__, __func__, __LINE__); return __LINE__; } while(0)

static void switch_to_edl_mode(void *usb_handle) {
    //DIAG commands used to switch the Qualcomm devices to EDL (Emergency download mode)
    unsigned char edl_cmd[] = {0x4b, 0x65, 0x01, 0x00, 0x54, 0x0f, 0x7e};
    unsigned char *pbuf = malloc(512);
    int rx_len;

    do {
        rx_len = qusb_noblock_read(usb_handle, pbuf , 512, 0, 1000);
    } while (rx_len > 0);

    dbg_time("switch to 'Emergency download mode'\n");
    rx_len = qusb_noblock_write(usb_handle, edl_cmd, sizeof(edl_cmd), sizeof(edl_cmd), 3000, 0);
    if (rx_len < 0)
        return;

    do {
        rx_len = qusb_noblock_read(usb_handle, pbuf , 512, 0, 1000);
        if (rx_len == sizeof(edl_cmd) && memcmp(pbuf, edl_cmd, sizeof(edl_cmd)) == 0) {
            dbg_time("successful, wait module reboot\n");
        }
    } while (rx_len > 0);

    free(pbuf);
}

void usage(int status) {
    if(status != EXIT_SUCCESS) {
        printf("Try '%s --help' for more information.\n", program_name);
    } else {
        dbg_time("Upgrade Quectel'module with Qualcomm's firehose protocol.\n");
        dbg_time("Usage: %s [options...]\n", program_name);
        dbg_time("    -f [package_dir]                         Upgrade package directory path\n");
        dbg_time("    -p [/dev/ttyUSBX]                        Diagnoise port, will auto-detect if not specified\n");
    }
    exit(status);
}
unsigned long get_file_size(const char* filename) {
    unsigned long size;
    FILE* fp = fopen(filename, "rb");
    if(fp == NULL) {
        dbg_time("Open file %s failed.\n", filename);
        return 0;
    }
    fseek(fp, SEEK_SET, SEEK_END);
    size = ftell(fp);
    fclose(fp);
    return size;
}

long long calc_filesizes(const char* path) {
    long long all_bytes = 0;
    struct dirent* de;
    DIR * dir;
    char temp[255+2];
    dir = opendir(path);
    if(dir == 0)
        return 0;
    while((de = readdir(dir))) {

        if(de->d_type == DT_DIR && strcmp(de->d_name, ".") && strcmp(de->d_name, "..")) {
            sprintf(temp, "%s/%s", path, de->d_name);
            all_bytes += calc_filesizes(temp);
        }
        if(DT_REG == de->d_type) {
            sprintf(temp, "%s/%s", path, de->d_name);
            all_bytes += get_file_size(temp);
        }
    }
    closedir(dir);
    return all_bytes;
}

/*
1. enum dir, fix up dirhose_dir
2. md5 examine
3. furture
*/
int system_ready(char** dirhose_dir) {
    char temp[255+2];

    if(strstr(*dirhose_dir, "firehose") != NULL) {
        /* Qflash call firehose */
        return 0;
    } else {
        //set_transfer_allbytes(calc_filesizes(*dirhose_dir));
        sprintf(temp, "%s/update/firehose", *dirhose_dir);
        if(access(temp, R_OK))
            error_return();
        free(*dirhose_dir);
        *dirhose_dir = strdup(temp);
        return 0;
    }
    error_return();
}

#ifdef FIREHOSE_ENABLE
int firehose_main_entry(int argc, char* argv[])
#else
int main(int argc, char* argv[])
#endif
{
    int opt;
    int retval;
    char *firehose_dir = NULL;
    const char *port_name = "/dev/ttyUSB0";
    void *usb_handle = NULL;
    int idVendor = 0, idProduct = 0, interfaceNum = 0;
    int edl_retry = 30;
    double start;

    /*build V1.0.3*/
    dbg_time("QFirehose Version: LTE_QFirehose_Linux&Android_V1.0.3\n");
    dbg_time("Builded: %s %s\n", __DATE__,__TIME__);
    optind = 1;
    program_name = argv[0];
    while ( -1 != (opt = getopt(argc, argv, "f:p:z:h"))) {
        switch (opt) {
        case 'f':
            firehose_dir = strdup(optarg);
            break;
        case 'p':
            port_name = optarg;
            break;
        case 'z':
            qusb_zlp_mode = !!atoi(optarg);
            break;
        case 'h':
            usage(EXIT_SUCCESS);
            break;
        default:
            break;
        }
    }

    if (firehose_dir == NULL) {
        usage(EXIT_SUCCESS);
        error_return();
    }

    if (access(firehose_dir, R_OK))
        error_return();

    opt = strlen(firehose_dir);
    if (firehose_dir[opt-1] == '/') {
        firehose_dir[opt-1] = '\0';
    }

    //hunter.lv add check dir 2018-07-28
    if(system_ready(&firehose_dir))
        error_return();
    //hunter.lv add check dir 2018-07-28

    while (edl_retry-- > 0) {
        usb_handle = qusb_noblock_open(port_name, &idVendor, &idProduct, &interfaceNum);
        if (usb_handle == NULL) {
            sleep(1);
            continue;
        }

        if (interfaceNum == 1)
            break;

        switch_to_edl_mode(usb_handle);
        qusb_noblock_close(usb_handle);
        sleep(1); //wait usb disconnect and re-connect
    }

    if (usb_handle == NULL || interfaceNum != 1) {
        if (usbfs_flag) system("rm -rf /dev/bus");
        error_return();
    }

    if (!access(port_name, R_OK)) {
        dbg_time("Error: when module in 'Emergency download mode', should not register to %s\n", port_name);
        dbg_time("Delete 05c6&9008 from 'drivers/usb/serial/qcserial.c' or disable qcserial from kernel config\n");
        qusb_noblock_close(usb_handle);
        if (usbfs_flag) system("rm -rf /dev/bus");
        error_return();
    }

    start = get_now();
    retval = sahara_main(firehose_dir, usb_handle);
    if (!retval) {
        retval = firehose_main(firehose_dir, usb_handle, qusb_zlp_mode);
        if(retval == 0) {
            get_duration(start);
            dbg_time("Upgrade module successfully.\n");
        }
    }

    qusb_noblock_close(usb_handle);

    if (usbfs_flag) system("rm -rf /dev/bus");

    return retval;
}


double get_now() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)tv.tv_sec + (double)tv.tv_usec / 1000000;
}
void get_duration(double start) {
    dbg_time("THE TOTAL DOWNLOAD TIME IS %.3f s\n",(get_now() - start));
}



void set_transfer_allbytes(long long bytes) {
    transfer_bytes = 0;
    all_bytes_to_transfer = bytes;
}
/*
return percent
*/
int update_transfer_bytes(long long bytes_cur) {
    static int last_percent = -1;
    int percent = 0;

    transfer_bytes += bytes_cur;
    percent = (transfer_bytes * 100) / all_bytes_to_transfer;
    if (percent != last_percent) {
        last_percent = percent;
        //printf("%lld - %lld \n", transfer_bytes, all_bytes_to_transfer);
        dbg_time("Upgrade progress:   %d\n", percent);
    } else {
        //printf("%d - %d\n", percent, last_percent);
    }

    return percent;
}
