<p align="center">
 <img style="" src="https://repository-images.githubusercontent.com/339300515/53c261b1-bbb2-4ea2-a97c-bab8b5938282" width="256"/>
 <p align="center">
  A QEMU-based emulation environment for the Espressif ESP32 board on Docker  🐳 . (WIP)
 </p>
</p>

### TL;DR
```
 $ docker run -it -p 8080:80 mluis/qemu-esp32
 $ idf
 $ idf.py build -C program
 $ ./flash.sh program/build/emulation.bin
 $ qemu-system-xtensa -nographic -M esp32 -m 4 -drive file=flash.bin,if=mtd,format=raw -nic user,model=open_eth,hostfwd=tcp::80-:80
```

## Building and Running

 - `$ docker build . -t qemu-esp32`
 - `$ docker run --name qemu-esp32 --rm -i -p 8080:80 -t qemu-esp32 bash`
 - `$ idf`

## Optional: Before compiling one might want to configure dependencies
 - `$ idf.py build -C program menuconfig`

## Running the example

 - `$ idf.py build -C program`
 - `$ ./flash.sh program/build/emulation.bin`
 - `$ qemu-system-xtensa -nographic -M esp32 -m 4 -drive file=flash.bin,if=mtd,format=raw -nic user,model=open_eth,hostfwd=tcp::80-:80`

## Point your browser to
 - `http://localhost:8080/hello`

## Sample Output
```
Adding SPI flash device
ets Jul 29 2019 12:21:46

rst:0x1 (POWERON_RESET),boot:0x12 (SPI_FAST_FLASH_BOOT)
configsip: 0, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:2
load:0x3fff0030,len:7136
load:0x40078000,len:15780
ho 0 tail 12 room 4
load:0x40080400,len:4
load:0x40080404,len:3884
entry 0x40080650
I (679) boot: ESP-IDF v5.2-dev-2756-g2bc1f2f574 2nd stage bootloader
I (681) boot: compile time Sep 16 2023 03:34:45
I (681) boot: Multicore bootloader
I (693) boot: chip revision: v0.0
I (695) boot.esp32: SPI Speed      : 40MHz
I (695) boot.esp32: SPI Mode       : DIO
I (695) boot.esp32: SPI Flash Size : 2MB
I (702) boot: Enabling RNG early entropy source...
I (708) boot: Partition Table:
I (709) boot: ## Label            Usage          Type ST Offset   Length
I (710) boot:  0 nvs              WiFi data        01 02 00009000 00006000
I (710) boot:  1 phy_init         RF data          01 01 0000f000 00001000
I (711) boot:  2 factory          factory app      00 00 00010000 00100000
I (715) boot: End of partition table
I (721) esp_image: segment 0: paddr=00010020 vaddr=3f400020 size=1338ch ( 78732) map
I (744) esp_image: segment 1: paddr=000233b4 vaddr=3ffb0000 size=021cch (  8652) load
I (759) esp_image: segment 2: paddr=00025588 vaddr=40080000 size=0aa90h ( 43664) load
I (783) esp_image: segment 3: paddr=00030020 vaddr=400d0020 size=398a0h (235680) map
I (816) esp_image: segment 4: paddr=000698c8 vaddr=4008aa90 size=01bb4h (  7092) load
I (830) boot: Loaded app from partition at offset 0x10000
I (830) boot: Disabling RNG early entropy source...
I (841) cpu_start: Multicore app
I (844) cpu_start: Pro cpu up.
I (845) cpu_start: Starting app cpu, entry point is 0x400810ec
I (510) cpu_start: App cpu up.
I (1384) cpu_start: Pro cpu start user code
I (1385) cpu_start: cpu freq: 160000000 Hz
I (1386) cpu_start: Application information:
I (1386) cpu_start: Project name:     emulation
I (1386) cpu_start: App version:      1
I (1387) cpu_start: Compile time:     Sep 16 2023 03:34:38
I (1387) cpu_start: ELF file SHA256:  b93f29606...
I (1388) cpu_start: ESP-IDF:          v5.2-dev-2756-g2bc1f2f574
I (1388) cpu_start: Min chip rev:     v0.0
I (1388) cpu_start: Max chip rev:     v3.99 
I (1388) cpu_start: Chip rev:         v0.0
I (1390) heap_init: Initializing. RAM available for dynamic allocation:
I (1391) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
I (1392) heap_init: At 3FFB3430 len 0002CBD0 (178 KiB): DRAM
I (1392) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
I (1392) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
I (1393) heap_init: At 4008C644 len 000139BC (78 KiB): IRAM
I (1425) spi_flash: detected chip: gd
I (1433) spi_flash: flash io: dio
W (1437) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
I (1442) app_start: Starting scheduler on CPU0
I (1444) app_start: Starting scheduler on CPU1
I (1444) main_task: Started on CPU0
I (1454) main_task: Calling app_main()
I (1484) esp_eth.netif.netif_glue: 00:00:00:00:00:03
I (1484) esp_eth.netif.netif_glue: ethernet attached to netif
I (1584) qemu-esp32: Starting server on port: '80'
I (1644) qemu-esp32: Registering URI handlers

 =======================================================
 |               HTTP SERVER ON 80                     |
 =======================================================

I (1644) main_task: Returned from app_main()
I (2624) esp_netif_handlers: eth ip: 10.0.2.15, mask: 255.255.255.0, gw: 10.0.2.2
I (19684) qemu-esp32: Found header => Host: localhost:8080
I (19694) qemu-esp32: Request headers lost
```
