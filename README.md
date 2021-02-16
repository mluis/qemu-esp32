# ESP32 Emulated Environment
 * $ idf
 * $ make -C program
 * $ ./flash.sh program/build/hello_world.bin
 * $ qemu-system-xtensa -nographic -M esp32 -drive file=flash.bin,if=mtd,format=raw
