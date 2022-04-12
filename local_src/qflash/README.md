# quectel-qflash

Qflash[^1], a upgrade tool for quectel devices.

# file directory tree

> If firehose directory is not exist, firehose can not be used.
>
> If fastboot directory is not exist, fastboot can not be used.
>

## Qflash help message

- fastboot upgrade method
fastboot should can be called when using '-m 0' (default) and '-m 2'
The difference is at the earlier process of upgrade. '-m 0' using sahara to get need boot files however '-m 2' using AT command to come into 'fastboot' mode and then do fastboot upgrade.
'-m 2' will save much more time than '-m 0'.
- firehose upgrade method
Users want to upgrade in this way need to remove qcserial module or remove '05c6:9008' from qcserial.c.

```bash
root@ubuntu:# ./QFlash -h
[03-26_10:12:37:321] QFlash Version: LTE_QFlash_Linux&Android_V1.4.10
[03-26_10:12:37:321] Builded at: Mar 26 2019 10:09:17
[03-26_10:12:37:369] Host runtime enviroment check ok
[03-26_10:12:37:369]
[03-26_10:12:37:369] The CPU is little endian
[03-26_10:12:37:369]
[03-26_10:12:37:369] ./QFlash [fastboot|firehose] [options...]
[03-26_10:12:37:369] [protocol]
[03-26_10:12:37:369]     fastboot                                 Use fastboot upgrade protocol
[03-26_10:12:37:369]     firehose                                 Use firehose upgrade protocol
[03-26_10:12:37:369] [parameters]
[03-26_10:12:37:369]     -f [package_path]                        Upgrade package path
[03-26_10:12:37:369]     -p [ttyUSBX]                             Diagnoise port, will auto-detect if not specified
[03-26_10:12:37:369]     -m [mode]                                Qflash upgrade method
[03-26_10:12:37:369]                                              method = 1 --> streaming download protocol
[03-26_10:12:37:369]                                              method = 0 --> fastboot download protocol
[03-26_10:12:37:369]                                              method = 2 --> fastboot download protocol (at command first)
[03-26_10:12:37:369]                                              method = 3 --> firehose download protocol
[03-26_10:12:37:369]     -u [vid[:pid]]                           Specify VID and PID mannully
[03-26_10:12:37:369]     -s [size]                                Transport block size
[03-26_10:12:37:369]     -v                                       Verbose
[03-26_10:12:37:369]     -h                                       Help message
root@ubuntu:#
```
