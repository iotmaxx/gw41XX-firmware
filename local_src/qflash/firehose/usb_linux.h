#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <sys/time.h>
#include <time.h>
#include <sys/stat.h>
#include <dirent.h>


void * qusb_noblock_open(const char *port_name, int *idVendor, int *idProduct, int *interfaceNum);
int qusb_noblock_close(void *handle);
int qusb_noblock_write(const void *handle, void *pbuf, int max_size, int min_size, int timeout_msec, int need_zlp);
int qusb_noblock_read(const void *handle, void *pbuf, int max_size, int min_size, int timeout_msec);
int qfile_find_xmlfile(const char *dir, const char *prefix, char** xmlfile);
void dbg_time (const char *fmt, ...);
double get_now();
void get_duration(double start);
int update_transfer_bytes(long long bytes_cur);
void set_transfer_allbytes(long long bytes);



extern int usbfs_flag;



#define MIN(a,b)	 ((a) < (b)? (a) : (b))
