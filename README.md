# ESP32 Emulated Environment

An Qemu-based emulator for the Espressif ESP32 board on 🐳 Docker.

## Building and Running

 - `$ docker build . -t qemu-esp32`
 - `$ docker run --name qemu-esp32 --rm -i -t qemu-esp32 bash`
 - `$ idf`

## Running an example

 - `$ make -C program`
 - `$ ./flash.sh program/build/hello-world.bin`
 - `$ qemu-system-xtensa -nographic -M esp32 -drive file=flash.bin,if=mtd,format=raw`
