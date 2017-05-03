/*
 * main.c
 *
 *  Created on: Mar 21, 2017
 *      Author: ROGyorgE
 */

#include <ctype.h>
#include <stdlib.h>

#include "xil_printf.h"
#include "xstatus.h"
#include "malloc.h"

#include "Ipmi/ipmi.h"

unsigned char verbose = 1;


int main()
{
	uint8_t manufDate[3] = {}, serialNum[3] = {};
	XStatus Status;

	xil_printf("\r\n----------------------------------------------------------");
	xil_printf("\r\nFMC-HDMI IPMI FRU programmer");
	xil_printf("\r\nThis app checks the FRU data in the EEPROM on the FMC-HDMI and upgrades it, if necessary.");
	xil_printf("\r\n----------------------------------------------------------");

	Status = InitSytem();
	if (Status != XST_SUCCESS)
	{
		xil_printf("\r\nInit failed, exiting.");
		return XST_SUCCESS;
	}

	if (!fIsCardPresent())
	{
		xil_printf("\r\nNo card is present in slot J1, exiting.");
		return 1;
	}

	int fUpgrade = fUpgradeNeeded(manufDate, serialNum);
	if (fUpgrade == XST_NO_DATA || fUpgrade == XST_FAILURE)
	{
		if (fUpgrade == XST_FAILURE) xil_printf("\r\nInvalid FRU data.");
		if (fUpgrade == XST_NO_DATA) xil_printf("\r\nNo upgrade needed.");
		xil_printf(" Force upgrade? [y/n]");
		char upg = getchar();
		if (upg == 'y' || upg == 'Y')
		{
			while (serialNum[0] == 0 && serialNum[1] == 0 && serialNum[2] == 0)
			{
				char buf[10];
				xil_printf("\r\nPlease enter FMC-HDMI serial number"
						" (seven characters just below the barcode): ");
				if (buf == fgets(buf, sizeof(buf), stdin))
				{
					char* szSN = buf;
					int ichSN;
					// Trim leading space
					while(isspace(*szSN)) szSN++;
					//Trim trailing space
					while(strlen(szSN) > 0 && isspace(szSN[strlen(szSN)-1])) szSN[strlen(szSN)-1] = '\0';

					if (strlen(szSN) == 7)
					{
						if (*szSN != 'd' && *szSN != 'D')
						{
							xil_printf("\r\nSerial number should start with letter 'D'.");
							continue;
						}
						++szSN;
					}
					else if (strlen(szSN) == 6) ;
					else
					{
						xil_printf("\r\nSerial number should be 7 characters long.");
						continue;
					}
					for (ichSN = 0; ichSN < 6; ++ichSN)
					{
						if (!isxdigit(szSN[ichSN]))
						{
							xil_printf("\r\nSerial number should be hexadecimal characters.");
							continue;
						}
					}
					uint32_t dwSN = strtoul(szSN, NULL, 16);
					serialNum[2] = dwSN & 0xFF; dwSN >>= 8;
					serialNum[1] = dwSN & 0xFF; dwSN >>= 8;
					serialNum[0] = dwSN & 0xFF; dwSN >>= 8;
					break;
				}
			}

			fUpgrade = XST_SUCCESS;
		}
	}

	if (fUpgrade == XST_SUCCESS)
	{
		uint32_t dwManDate, dwSerialNum;
		dwManDate = ((uint32_t)manufDate[2]) << 16 | ((uint32_t)manufDate[1]) << 8 | (manufDate[0]);
		dwSerialNum = ((uint32_t)serialNum[0]) << 16 | ((uint32_t)serialNum[1]) << 8 | (serialNum[2]);
		if (XST_SUCCESS == WriteIpmiToEeprom(dwManDate, dwSerialNum))
			xil_printf("\r\nUpgrade succeeded.");
		else
			xil_printf("\r\nUpgrade failed.");
	} else
	{
		xil_printf("\r\nNothing to do, exiting.");
	}
	return 0;
}
