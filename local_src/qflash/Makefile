export USE_NDK=1
NDK_BUILD=/android/android-ndk/android-ndk-r10e/ndk-build
NDK_PROJECT_PATH=`pwd`
NDK_DEBUG=0
APP_ABI=armeabi-v7a,arm64-v8a#,x86,mips,armeabi-v7a,arm64-v8a,mips64,x86_64
APP_BUILD_SCRIPT=Android.mk
NDK_APPLICATION_MK=Application.mk
NDK_OUT=out

#CFLAGS+=-Wall
#CFLAGS+=-O2
#CFLAGS+=-Wmissing-declarations
#CFLAGS+=-fno-strict-aliasing
#CFLAGS+=-Wno-deprecated-declarations
#CFLAGS+=-Wint-to-pointer-cast
#CFLAGS+=-Wfloat-equal
#CFLAGS+=-Wno-unused-parameter
#CFLAGS+=-Wno-sign-compare
#CFLAGS+=-Wunused-but-set-variable
#CFLAGS+=-Wundef
#CFLAGS+=-Wpointer-arith
#CFLAGS+=-Winit-self
#CFLAGS+=-Wshadow
#CFLAGS+=-Wmissing-include-dirs
#CFLAGS+=-Waggregate-return
#CFLAGS+=-Wformat-security
#CFLAGS+=-Wtype-limits
## CFLAGS+=-Werror
#CFLAGS+=-Wunreachable-code
#CFLAGS+=-pipe
#CFLAGS+=-fstack-check
#CFLAGS+=-Wredundant-decls
#CFLAGS+=-fstack-protector-all

FASTBOOT_FILES+=fastboot/protocol.c
FASTBOOT_FILES+=fastboot/engine.c
FASTBOOT_FILES+=fastboot/fastboot.c
FASTBOOT_FILES+=fastboot/usb_linux_fastboot.c
FASTBOOT_FILES+=fastboot/util_linux.c

FIREHOSE_FILES+=firehose/qfirehose.c
FIREHOSE_FILES+=firehose/sahara_protocol.c
FIREHOSE_FILES+=firehose/firehose_protocol.c
FIREHOSE_FILES+=firehose/usb_linux.c

QFLASH_FILES+=tinystr.cpp
QFLASH_FILES+=tinyxml.cpp
QFLASH_FILES+=tinyxmlerror.cpp
QFLASH_FILES+=tinyxmlparser.cpp
QFLASH_FILES+=md5.cpp
QFLASH_FILES+=at_tok.cpp
QFLASH_FILES+=atchannel.cpp
QFLASH_FILES+=ril-daemon.cpp
QFLASH_FILES+=download.cpp
QFLASH_FILES+=file.cpp
QFLASH_FILES+=os_linux.cpp
QFLASH_FILES+=serialif.cpp
QFLASH_FILES+=quectel_log.cpp
QFLASH_FILES+=quectel_common.cpp
QFLASH_FILES+=quectel_crc.cpp
QFLASH_FILES+=check_env.cpp

LIBS+=-lrt
LIBS+=-lpthread

TARGET=QFlash

all:
	rm -rf *.o
	$(CC) -g -c -DPROGRESS_FILE_FAETURE -DUSE_FASTBOOT $(FASTBOOT_FILES)
	$(CC) -g -c -DPROGRESS_FILE_FAETURE -DFIREHOSE_ENABLE $(FIREHOSE_FILES)
	$(CXX) -g -c -DPROGRESS_FILE_FAETURE -DFIREHOSE_ENABLE $(QFLASH_FILES)
	$(CXX) *.o $(LIBS) -o $(TARGET)
debug:
	rm -rf *.o
	$(CROSS_COMPILE)gcc -DDEBUG -g -c -DPROGRESS_FILE_FAETURE -DUSE_FASTBOOT $(FASTBOOT_FILES)
	$(CROSS_COMPILE)gcc -DDEBUG -g -c -DPROGRESS_FILE_FAETURE -DFIREHOSE_ENABLE $(FIREHOSE_FILES)
	$(CROSS_COMPILE)g++ -DDEBUG -g -c -DPROGRESS_FILE_FAETURE -DFIREHOSE_ENABLE $(QFLASH_FILES)
	$(CROSS_COMPILE)g++ *.o $(LIBS) -o $(TARGET)
android: clean
	$(NDK_BUILD) V=0 NDK_OUT=$(NDK_OUT)  NDK_APPLICATION_MK=$(NDK_APPLICATION_MK) NDK_LIBS_OUT=$(NDK_LIBS_OUT) APP_BUILD_SCRIPT=$(APP_BUILD_SCRIPT) NDK_PROJECT_PATH=$(NDK_PROJECT_PATH) NDK_DEBUG=$(NDK_DEBUG) APP_ABI=$(APP_ABI)
clean:
	rm -rf $(NDK_OUT) libs *.o QFlash QFlash *~
	cd firehose && make clean && cd ..
	cd fastboot && make clean && cd ..
	
