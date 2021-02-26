# ESP32 Emulated Environment (WIP)

An Qemu-based emulation environment for the Espressif ESP32 board on Docker  🐳 .

## TL;DR
 - `$ docker run -it mluis/qemu-esp32`
 - `$ idf`
 - `$ make -C program`
 - `$ ./flash.sh program/build/emulation.bin`
 - `$ qemu-system-xtensa -nographic -M esp32 -m 4 -drive file=flash.bin,if=mtd,format=raw -nic user,model=open_eth,hostfwd=tcp::80-:80  -s`

## Building and Running

 - `$ docker build . -t qemu-esp32`
 - `$ docker run --name qemu-esp32 --rm -i -t qemu-esp32 bash`
 - `$ idf`

## Optional: Before compiling one might want to configure dependencies
 - `$ make -C program menuconfig`

## Running the example

 - `$ make -C program`
 - `$ ./flash.sh program/build/emulation.bin`
 - `$ qemu-system-xtensa -nographic -M esp32 -m 4 -drive file=flash.bin,if=mtd,format=raw -nic user,model=open_eth,hostfwd=tcp::80-:80  -s`

## Sample Output

```
rst:0x1 (POWERON_RESET),boot:0x12 (SPI_FAST_FLASH_BOOT)
configsip: 0, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:2
load:0x3fff0030,len:5404
ho 0 tail 12 room 4
load:0x40078000,len:13772
load:0x40080400,len:3180
entry 0x400805fc
I (4647) cpu_start: Pro cpu up.
I (4700) cpu_start: Single core mode
I (13566) cpu_start: Pro cpu start user code
I (13585) cpu_start: cpu freq: 240000000
I (13611) cpu_start: Application information:
I (13637) cpu_start: Project name:     emulation
I (13660) cpu_start: App version:      1
I (13670) cpu_start: Compile time:     Feb 26 2021 00:51:13
I (13700) cpu_start: ELF file SHA256:  69efbc9ade63be58...
I (13726) cpu_start: ESP-IDF:          v4.4-dev-4-g73db14240
I (13773) heap_init: Initializing. RAM available for dynamic allocation:
I (13823) heap_init: At 3FF80000 len 00002000 (8 KiB): RTCRAM
I (13857) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
I (13874) heap_init: At 3FFB74F8 len 00028B08 (162 KiB): DRAM
I (13895) heap_init: At 3FFE0440 len 00017BC0 (94 KiB): D/IRAM
I (13927) heap_init: At 40078000 len 00008000 (32 KiB): IRAM
I (13951) heap_init: At 400944B8 len 0000BB48 (46 KiB): IRAM
I (14093) esp_apptrace: Initialized TRAX on CPU0
I (14205) spi_flash: detected chip: gd
I (14330) spi_flash: flash io: dio
I (14460) cpu_start: Starting scheduler on PRO CPU.
I (15975) wifi:wifi driver task: 3ffbd4b4, prio:23, stack:6656, core=0
I (19865) wifi:wifi firmware version: 6b2834e
I (19895) wifi:wifi certification version: v7.0
I (19935) wifi:config NVS flash: enabled
I (19975) wifi:config nano formating: disabled
I (20025) wifi:Init data frame dynamic rx buffer num: 32
I (20065) wifi:Init management frame dynamic rx buffer num: 32
I (20115) wifi:Init management short buffer num: 32
I (20155) wifi:Init dynamic tx buffer num: 32
I (20215) wifi:Init static rx buffer size: 1600
I (20265) wifi:Init static rx buffer num: 10
I (20305) wifi:Init dynamic rx buffer num: 32
I (20405) wifi_init: rx ba win: 6
I (20435) wifi_init: tcpip mbox: 32
I (20475) wifi_init: udp mbox: 6
I (20505) wifi_init: tcp mbox: 6
I (20525) wifi_init: tcp tx win: 5744
I (20575) wifi_init: tcp rx win: 5744
I (20615) wifi_init: tcp mss: 1440
I (20645) wifi_init: WiFi IRAM OP enabled
I (20685) wifi_init: WiFi RX IRAM OP enabled
I (20735) qemu-esp32: - IPv4 address: 172.17.0.2
I (20755) qemu-esp32: Starting server on port: '80'
I (20985) qemu-esp32: Registering URI handlers

 =======================================================
 |               HTTP SERVER ON 80                     |
 =======================================================
```
