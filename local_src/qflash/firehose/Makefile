NDK_BUILD:=/workspace/android-ndk/android-ndk-r10e/ndk-build

linux:
	$(CROSS_COMPILE)gcc -Wall -g firehose_protocol.c  qfirehose.c  sahara_protocol.c  usb_linux.c  -o qfirehose -lpthread -ldl
	$(CROSS_COMPILE)gcc -Wall -g usb2tcp.c -o usb2tcp -lpthread -ldl

android:
	$(NDK_BUILD) V=0 APP_BUILD_SCRIPT=Android.mk NDK_PROJECT_PATH=`pwd` NDK_DEBUG=0 APP_ABI='armeabi-v7a,arm64-v8a'
	rm -rf obj
	mv libs android

clean:
	rm -rf qfirehose obj libs android usb2tcp *~
