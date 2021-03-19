CC = /opt/OSELAS.Toolchain-2019.09.1/arm-v7a-linux-gnueabihf/gcc-9.2.1-clang-8.0.1-glibc-2.30-binutils-2.32-kernel-5.0-sanitized/bin/arm-v7a-linux-gnueabihf-gcc
LDFLAGS += 
SOURCES_WR = crc.c eepromWriter.c
SOURCES_DP = crc.c eepromDumper.c 
INCLUDES = eepromContent.h crc.h
OBJECTS_WR = $(SOURCES_WR:.c=.o)
OBJECTS_DP = $(SOURCES_DP:.c=.o)
OBJECTS = $(OBJECTS_WR) $(OBJECTS_DP)
TARGETS = eepromDumper eepromWriter

all: $(TARGETS)

eepromDumper: $(OBJECTS_DP)
	$(CC) $(CFLAGS) -o eepromDumper $(OBJECTS_DP) $(LDFLAGS)

eepromWriter: $(OBJECTS_WR)
	$(CC) $(CFLAGS) -o eepromWriter $(OBJECTS_WR) $(LDFLAGS)

%.o: %.c $(INCLUDES)
	$(CC) -Wall -c $<

install:
