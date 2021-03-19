#include <stdint.h>

#define fldsiz(name, field) (sizeof(((struct name *)0)->field))

#define IOTMAXX_MAGIC 0xC4EC31B6

struct sVersion
{
    uint8_t u8Major;
    uint8_t u8Minor;
    uint8_t u8Build;
};

union uVersion
{
    uint32_t u32Version;
    struct sVersion sVersion;
};

struct eeCommonData
{
    uint32_t u32Magic;            // magic number
    uint32_t u32Checksum;         // section checksum (not including u32Magic and u32Checksum)
    char caOverlayName[16];       // name of overlay (e.g. 'test' for test.dto)
    uint32_t u32Product;          // product id
    union uVersion uVersion;      // product version
    char caProductName[16];       // name of product (human readable)
    char caSerialNumber[16];      // serial number of product (e.g. IMEI)
    uint8_t u8Manufacturer;       // manufacturer of product (iotmaxx assigned id)
    uint32_t u32TimeOfProduction; // time of production (unix timestamp)
    uint8_t u8Tester;             // tested by (iotmaxx assigned id)
    uint8_t u8TestResult;         // test result (tbd)
    uint32_t u32TimeOfTest;       // time of test (unix timestamp)
    union uVersion eepromVersion; // version of eeprom structure
};

struct eeSpecificData
{
    uint32_t u32Magic;    // magic number
    uint32_t u32Checksum; // section checksum (not including u32Magic and u32Checksum)
    uint8_t u8aMAC[6];    // MAC address
};

struct eeSectionCData
{
    uint32_t u32Magic;    // magic number
    uint32_t u32Checksum; // section checksum (not including u32Magic and u32Checksum)
};

struct eeCertificates
{
    uint32_t u32Magic;    // magic number
    uint32_t u32Checksum; // section checksum (not including u32Magic and u32Checksum)
};

struct eeUserData
{
    uint32_t u32Magic;    // magic number
    uint32_t u32Checksum; // section checksum (not including u32Magic and u32Checksum)
};

struct eepromData
{
    union
    {
        uint8_t u8aSectionA[256];
        struct eeCommonData commonData;
    } sectionA; // data common for all boards
    union
    {
        uint8_t u8aSectionB[256];
        struct eeSpecificData specificData;
    } sectionB; // board specifc data
    union
    {
        uint8_t u8aSectionC[512];
        struct eeSectionCData sectionCData;
    } sectionC; // unused
    union
    {
        uint8_t u8aSectionD[3 * 1024];
        struct eeCertificates certificates;
    } sectionD; // certificates
    union
    {
        uint8_t u8aSectionD[4 * 1024];
        struct eeUserData userData;
    } sectionE; // user data, application/project specific
};

static inline int eeprom_data_valid(struct eepromData *data)
{
    return data->sectionA.commonData.u32Magic == IOTMAXX_MAGIC ? 1 : 0;
}
