# ESP32 Emulated Environment (WIP)

A QEMU-based emulation environment for the Espressif ESP32 board on Docker  🐳 .

## TL;DR
 - `$ docker run -it -p 8080:80 mluis/qemu-esp32`
 - `$ idf`
 - `$ idf.py build -C program`
 - `$ ./flash.sh program/build/emulation.bin`
 - `$ qemu-system-xtensa -nographic -M esp32 -m 4 -drive file=flash.bin,if=mtd,format=raw -nic user,model=open_eth,hostfwd=tcp::80-:80  -s`

## Building and Running

 - `$ docker build . -t qemu-esp32`
 - `$ docker run --name qemu-esp32 --rm -i -p 8080:80 -t qemu-esp32 bash`
 - `$ idf`

## Optional: Before compiling one might want to configure dependencies
 - `$ idf.py build -C program menuconfig`

## Running the example

 - `$ idf.py build -C program`
 - `$ ./flash.sh program/build/emulation.bin`
 - `$ qemu-system-xtensa -nographic -M esp32 -m 4 -drive file=flash.bin,if=mtd,format=raw -nic user,model=open_eth,hostfwd=tcp::80-:80  -s`

## Point your browser to
 - `http://localhost:8080/hello`

## Sample Output

```
rst:0x1 (POWERON_RESET),boot:0x12 (SPI_FAST_FLASH_BOOT)
configsip: 0, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:2
load:0x3fff0030,len:5704
load:0x40078000,len:14748
ho 0 tail 12 room 4
load:0x40080400,len:3268
entry 0x400805bc
I (1163) cpu_start: Pro cpu up.
I (1171) cpu_start: Single core mode
I (1208) cpu_start: Pro cpu start user code
I (1208) cpu_start: cpu freq: 240000000 Hz
I (1209) cpu_start: Application information:
I (1209) cpu_start: Project name:     emulation
I (1210) cpu_start: App version:      1
I (1210) cpu_start: Compile time:     Sep 15 2023 22:58:44
I (1211) cpu_start: ELF file SHA256:  2ad44943922979dc...
I (1211) cpu_start: ESP-IDF:          v5.1-dev-1626-g4b6d9c8ad3
I (1214) heap_init: Initializing. RAM available for dynamic allocation:
I (1216) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
I (1216) heap_init: At 3FFB34D0 len 0002CB30 (178 KiB): DRAM
I (1217) heap_init: At 3FFE0440 len 0001FBC0 (126 KiB): D/IRAM
I (1217) heap_init: At 40078000 len 00008000 (32 KiB): IRAM
I (1218) heap_init: At 4008C1C0 len 00013E40 (79 KiB): IRAM
I (1218) heap_init: At 3FF80000 len 00002000 (8 KiB): RTCRAM
I (1250) spi_flash: detected chip: gd
I (1259) spi_flash: flash io: dio
I (1284) cpu_start: Starting scheduler on PRO CPU.
I (1439) esp_eth.netif.netif_glue: 02:00:00:be:ee:f2
I (1449) esp_eth.netif.netif_glue: ethernet attached to netif
I (1569) qemu-esp32: Starting server on port: '80'
I (1589) qemu-esp32: Registering URI handlers

 =======================================================
 |               HTTP SERVER ON 80                     |
 =======================================================

I (2559) esp_netif_handlers: eth ip: 10.0.2.15, mask: 255.255.255.0, gw: 10.0.2.2
I (2699) qemu-esp32: HELLO HANDLER CALLED
I (2699) qemu-esp32: Found header => Host: localhost:8080
I (2719) qemu-esp32: Request headers lost
```
