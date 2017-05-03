# FMC-HDMI FRU fix
Created for Vivado 2016.4

[Link to the project wiki](https://reference.digilentinc.com/fmc_hdmi/refmanual)

This system designed to be run on the Digilent Zedboard checks the FRU data in the FMC IPMI EEPROM of a connected Digilent FMC-HDMI mezzanine card and performs an upgrade, if necessary.
The new FRU data should solve issue #1 described in the errata section of the FMC-HDMI reference manual.

Usage instructions:
To run the programmer copy BOOT.bin to an SD card or use SDK to program the Flash and boot the device with the correct boot mode jumpers.
You may also use SDK to download the bitstream and the fmc_hdmi_ipmi_fix application to the Zynq, if only one FMC-HDMI needs to be reprogrammed.
Connect a USB cable to the UART port of the Zedboard and open a terminal to the correct COM port with 115200-8-1-N settings. The terminal should show the following message: 
```
----------------------------------------------------------
FMC-HDMI IPMI FRU programmer
This app checks the FRU data in the EEPROM on the FMC-HDMI and upgrades it, if necessary.
----------------------------------------------------------
No upgrade needed. Force upgrade? [y/n]
Starting the FMC EEprom program...
```
Answer any prompts (followed by Enter) to reprogram the boards. The terminal might need to be set to Auto-Echo to see the pressed keys.
