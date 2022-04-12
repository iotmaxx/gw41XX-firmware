export USE_NDK=1
NDK_BUILD=/workspace/android-ndk/android-ndk-r10e/ndk-build
NDK_PROJECT_PATH=`pwd`
NDK_DEBUG=0
APP_ABI=armeabi#,x86,mips,armeabi-v7a,arm64-v8a,mips64,x86_64
APP_BUILD_SCRIPT=Android.mk
NDK_OUT=out

all:
	rm -rf *.o
	$(CC) -g -c protocol.c engine.c fastboot.c usb_linux_fastboot.c util_linux.c quectel_log.c
	$(CXX) *.o -lrt -lpthread -o qfastboot
android: clean
	$(NDK_BUILD) V=0 NDK_OUT=$(NDK_OUT)  NDK_LIBS_OUT=$(NDK_LIBS_OUT) APP_BUILD_SCRIPT=$(APP_BUILD_SCRIPT) NDK_PROJECT_PATH=$(NDK_PROJECT_PATH) NDK_DEBUG=$(NDK_DEBUG) APP_ABI=$(APP_ABI)
clean:
	rm -rf $(NDK_OUT) libs *.o qfastboot *~
	
