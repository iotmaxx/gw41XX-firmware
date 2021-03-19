#include "eepromContent.h"
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <ctype.h>
#include "crc.h"
#include <stddef.h>
#include <string.h>

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


static int imx7d_iotmaxx_read_eeprom(const char *file, struct eepromData *data)
{
	int fd;
	int ret;

	fd = open(file, O_RDONLY);
	if (fd < 0) {
		ret = fd;
		goto err;
	}

	ret = read(fd, data, sizeof(*data));
	if (ret < 0)
		goto err_open;

	ret = 0;

err_open:
	close(fd);
err:
	return ret;
}

void printCommonData(struct eeCommonData *commonData)
{
	char caPrintBuf[64];
	char overlay_name[17];
	printf("Common data section:\r\n");
	printf("\t%-24s0x%08x\r\n","u32Magic",commonData->u32Magic);
	printf("\t%-24s0x%08x\r\n","u32Checksum",commonData->u32Checksum);
	if(isprint(commonData->caOverlayName[0]))
	{
		commonData->caOverlayName[16-1] = '\0';
		printf("\t%-24s%s\r\n","caOverlayName",commonData->caOverlayName);
		strncpy(overlay_name, commonData->caOverlayName, 16);
		overlay_name[16] = '\0';
		sprintf(caPrintBuf,"/boot/%s.dto", overlay_name);
		printf("Overlay name: '%s'\r\n", caPrintBuf);

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
}

void printEEPROM(struct eepromData *eepromData)
{
	printCommonData(&eepromData->sectionA.commonData);
}

// todo: use generic section
uint32_t u32SectionChecksum(void *theDataStruct, uint16_t u16SectionSize)
{
	struct eeCommonData *theData = (struct eeCommonData *)theDataStruct;
	dumpData((void *)theData + offsetof(struct eeCommonData, caOverlayName), fldsiz(eepromData, sectionA) - offsetof(struct eeCommonData, caOverlayName));
	crcInit(); 
	return crcFast((void *)theData + offsetof(struct eeCommonData, caOverlayName), fldsiz(eepromData, sectionA) - offsetof(struct eeCommonData, caOverlayName));
}

int main(int argc, char* argv[])
{
    struct eepromData eepromData;
	uint32_t u32Crc;

	if(argc < 2)
		printf("Usage: %s <eeprom>\r\n",argv[0]);
	else
	{
		if(imx7d_iotmaxx_read_eeprom(argv[1], &eepromData) == 0)
		{
			if(!eeprom_data_valid(&eepromData))
				printf("\r\nWrong magic number 0x%08x, expected 0x%08x, content invalid\r\n\r\n",eepromData.sectionA.commonData.u32Magic,IOTMAXX_MAGIC);
			u32Crc = u32SectionChecksum(&eepromData.sectionA.commonData, sizeof(eepromData.sectionA));
			if(u32Crc == eepromData.sectionA.commonData.u32Checksum)
				printf("Checksum ok\r\n");
			else
				printf("Checksum fail (eeprom: %08x, calc: %08x\r\n", eepromData.sectionA.commonData.u32Checksum, u32Crc);

			printEEPROM(&eepromData);
		}
		else
			printf("Failed to open %s\r\n",argv[1]);
	}
}
