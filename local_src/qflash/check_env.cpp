#include "quectel_log.h"
#include "quectel_common.h"
#include <sys/utsname.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>

bool is_prog_installed(const char *progname)
{
    char buf[128] = {'\0'};
    FILE* fpin = NULL;

    snprintf(buf, ARRAY_SIZE(buf), "dpkg -l|grep %s", progname);
    fpin = popen(buf, "r");
    if (!fpin) {
        log_error("popen failed strerror: %s\n", strerror(errno));
        return false;
    }

    while (fgets(buf, ARRAY_SIZE(buf), fpin) != NULL) {
        if (strstr(buf, progname)) {
            log_info("dpkg find %s\n", progname);
            return true;
        }
    }

    return false;
}

bool is_module_installed(const char *modname)
{
    char buf[128] = {'\0'};
    struct utsname tsname;

    if (uname(&tsname) == -1) {
        log_error("Function uname failed errno=%d,(%s)\n", errno, strerror(errno));
        return false;
    } 
    
    snprintf(buf, ARRAY_SIZE(buf), "/lib/modules/%s/kernel/drivers/usb/serial/qcserial.ko", tsname.release);
    if (access(buf, F_OK) == 0) {
        log_info("Find %s.ko in %s\n", modname, buf);
        return true;
    }
    return false;
}

bool is_arg_valid(const char *arg)
{
    ret_val_if_fail(strchr(arg, '&') == NULL, false);
    ret_val_if_fail(strchr(arg, '|') == NULL, false);
    return true;
}

bool check_env()
{
    bool ret = true;
    if (is_module_installed("qcserial") == true) {
        log_error("Module qcserial.ko is found. Please delete the module when do upgrade.\n");
        log_error("You shall do this in root.\n");
        ret = false;
    }

    if (is_prog_installed("modemmanager") == true) {
        log_error("Program \"modemmanager\" is found. Please remove it.\n");
        log_error("You shall do this in root.\n");
        ret = false;
    }
    return ret;
}

bool check_input(int argc, char **argv)
{
    int idx = 0;
    char buf[128] = {'\0'};
    while (idx < argc) {
        if ((argv[idx][0] == '&') ||
            (argv[idx][strlen(argv[idx] - 1)] == '&')){
            // for & background feature
            continue;
        }
        ret_val_if_fail(is_arg_valid(argv[idx]), false);
        idx++;
    }
    
    if (getcwd(buf, sizeof(buf)) == NULL) {
        log_error("%s getcwd failed errno=%d(%s).\n", __FUNCTION__, errno, strerror(errno));
        return true;
    }
    ret_val_if_fail(is_arg_valid(buf), false);
    return true;
}

bool check(int argc, char **argv)
{
    bool ret = true;
    struct utsname tsname;

    if (uname(&tsname) == -1) {
        log_error("Function uname failed errno=%d,(%s)\n", errno, strerror(errno));
        return false;
    }
    log_debug("*********************** platform info *************************\n");
    log_debug("* sysname: %s\n", tsname.sysname);
    log_debug("* nodename: %s\n", tsname.nodename);
    log_debug("* release: %s\n", tsname.release);
    log_debug("* version: %s\n", tsname.version);
    log_debug("* machine: %s\n", tsname.machine);
    log_debug("**************************** end ******************************\n");
  
    if (check_env() == false)
        ret = false;
    if (check_input(argc, argv) == false) {
        ret = false;
        log_error("bash keywords should not be includes in path\n");
    }
    if (ret == true) {
        log_info("Host runtime enviroment check ok\n");
    }
    return ret;
}

