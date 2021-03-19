#include "eepromContent.h"
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <ctype.h>
#include <string.h>
#include "crc.h"
#include <stddef.h>

static int writeEEPROMData(const char *file, struct eepromData *data)
{
	int fd;
	int ret;

    mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;

	fd = open(file, O_RDWR | O_CREAT, mode);
	if (fd < 0) {
		ret = fd;
		goto err;
	}

	ret = write(fd, data, sizeof(*data));
	if (ret < 0)
    {
		goto err_open;
    }

	ret = 0;

err_open:
	close(fd);
err:
	return ret;
}

void printCommonData(struct eeCommonData *commonData)
{
	printf("Common data section:\r\n");
	printf("\t%-24s0x%08x\r\n","u32Magic",commonData->u32Magic);
	printf("\t%-24s0x%08x\r\n","u32Checksum",commonData->u32Checksum);
	if(isprint(commonData->caOverlayName[0]))
	{
		commonData->caOverlayName[16-1] = '\0';
		printf("\t%-24s%s\r\n","caOverlayName",commonData->caOverlayName);
	}
	else
		printf("\t%-24s%s\r\n","caOverlayName","N/A");
	printf("\t%-24s0x%08x\r\n","u32Product",commonData->u32Product);
	printf("\t%-24s%d.%d.%d\r\n","uVersion",commonData->uVersion.sVersion.u8Major,commonData->uVersion.sVersion.u8Minor,commonData->uVersion.sVersion.u8Build);
	if(isprint(commonData->caProductName[0]))
	{
		commonData->caProductName[16-1] = '\0';
		printf("\t%-24s%s\r\n","caProductName",commonData->caProductName);
	}
	else
		printf("\t%-24s%s\r\n","caProductName","N/A");
	if(isprint(commonData->caSerialNumber[0]))
	{
		commonData->caSerialNumber[16-1] = '\0';
		printf("\t%-24s%s\r\n","caSerialNumber",commonData->caSerialNumber);
	}
	else
		printf("\t%-24s%s\r\n","caSerialNumber","N/A");
	printf("\t%-24s0x%02x\r\n","u8Manufacturer",commonData->u8Manufacturer);
	printf("\t%-24s%u\r\n","u32TimeOfProduction",commonData->u32TimeOfProduction);
	printf("\t%-24s0x%02x\r\n","u8Tester",commonData->u8Tester);
	printf("\t%-24s0x%02x\r\n","u8TestResult",commonData->u8TestResult);
	printf("\t%-24s%u\r\n","u32TimeOfTest",commonData->u32TimeOfTest);
	printf("\t%-24s%d.%d.%d\r\n","eeprom Version",commonData->eepromVersion.sVersion.u8Major,commonData->eepromVersion.sVersion.u8Minor,commonData->eepromVersion.sVersion.u8Build);
}

void printSpecificData(struct eeSpecificData *specificData)
{
	printf("Specific data section:\r\n");
	printf("\t%-24s0x%08x\r\n","u32Magic",specificData->u32Magic);
	printf("\t%-24s0x%08x\r\n","u32Checksum",specificData->u32Checksum);
	printf("\t%-24s%02x:%02x:%02x:%02x:%02x:%02x\r\n","u8aMAC",
		specificData->u8aMAC[0],specificData->u8aMAC[1],specificData->u8aMAC[2],specificData->u8aMAC[3],specificData->u8aMAC[4],specificData->u8aMAC[5]);
}

void printEEPROM(struct eepromData *eepromData)
{
	printCommonData(&eepromData->sectionA.commonData);
	printSpecificData(&eepromData->sectionB.specificData);
}

void dumpData(uint8_t *theData, size_t dataLen)
{
    size_t idx;
    int lineCnt = 0;
    printf("Dump:");
    for(idx=0;idx<dataLen;idx++)
    {
        if(!(idx%16))
            printf("\r\n%03d:", lineCnt++);
        printf(" %02x", theData[idx]);
    }
    printf("\r\n\r\n");
}

void fillCommonData(struct eeCommonData *commonData)
{
    uint32_t u32Crc;

    commonData->u32Magic            = IOTMAXX_MAGIC;        // magic number

    commonData->u32Product          = 1;	                // product id
    commonData->u8Manufacturer      = 1;                    // manufacturer of product (iotmaxx assigned id)
    commonData->u32TimeOfProduction = 1615802781ul;             // time of production (unix timestamp)
    commonData->u8Tester            = 0x00;                 // tested by (iotmaxx assigned id)
    commonData->u8TestResult        = 0;                    // test result (tbd)
    commonData->u32TimeOfTest       = 1615802781ul;             // time of test (unix timestamp)
    commonData->uVersion.sVersion.u8Major   = 1;            // product version
    commonData->uVersion.sVersion.u8Minor   = 9;
    commonData->uVersion.sVersion.u8Build   = 1;
	memset(commonData->caOverlayName, '\0', sizeof(commonData->caOverlayName));
    strcpy(commonData->caOverlayName,  "sensexp");             // name of overlay (e.g. 'test' for test.dto)
    strcpy(commonData->caProductName,  "GW4100");     		// name of product (human readable)
    strcpy(commonData->caSerialNumber, "867962045313387");  // serial number of product (e.g. IMEI)
    commonData->eepromVersion.sVersion.u8Major   = 1;            // eeprom version
    commonData->eepromVersion.sVersion.u8Minor   = 1;
    commonData->eepromVersion.sVersion.u8Build   = 1;

    u32Crc = crcFast( (void *)commonData + offsetof(struct eeCommonData, caOverlayName), fldsiz(eepromData, sectionA) - offsetof(struct eeCommonData, caOverlayName));
 //   crc32(0x80000000, (void *)commonData + offsetof(struct eeCommonData, caOverlayName), fldsiz(eepromData, sectionA) - offsetof(struct eeCommonData, caOverlayName));    
    commonData->u32Checksum         = u32Crc;               // section checksum (not including u32Magic and u32Checksum)
    dumpData((void *)commonData + offsetof(struct eeCommonData, caOverlayName), fldsiz(eepromData, sectionA) - offsetof(struct eeCommonData, caOverlayName));
}

void fillSpecificData(struct eeSpecificData *specificData)
{
	uint32_t u32Crc;

    specificData->u32Magic            = IOTMAXX_MAGIC;        // magic number
	specificData->u8aMAC[0] = 0x30;
	specificData->u8aMAC[1] = 0x49;
	specificData->u8aMAC[2] = 0x50;
	specificData->u8aMAC[3] = 0xE7;
	specificData->u8aMAC[4] = 0xA1;
	specificData->u8aMAC[5] = 0x20;
    u32Crc = crcFast( (void *)specificData + offsetof(struct eeSpecificData, u8aMAC), fldsiz(eepromData, sectionB) - offsetof(struct eeSpecificData, u8aMAC));
    specificData->u32Checksum         = u32Crc;               // section checksum (not including u32Magic and u32Checksum)
    dumpData( (void *)specificData + offsetof(struct eeSpecificData, u8aMAC), fldsiz(eepromData, sectionB) - offsetof(struct eeSpecificData, u8aMAC));
}

void fillEEPROMData(struct eepromData *eepromData)
{
    fillCommonData(&eepromData->sectionA.commonData);
    fillSpecificData(&eepromData->sectionB.specificData);
}

int main(int argc, char* argv[])
{
    struct eepromData eepromData;

    memset(&eepromData, 0xFF, sizeof(eepromData));
	crcInit(); 


	if(argc < 2)
		printf("Usage: %s <eeprom>\r\n",argv[0]);
	else
	{
        fillEEPROMData(&eepromData);
        if(writeEEPROMData(argv[1], &eepromData))
            printf("Failed to write EEPROM data to %s\r\n",argv[1]);
        else
            printf("EEPROM size %ld written.\r\n", sizeof(eepromData));
    	printEEPROM(&eepromData);
	}
}
