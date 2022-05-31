if [ -z "$1" ]
  then
    echo "eg: flash.sh application.bin"
    exit
fi
dd if=/dev/zero bs=1M count=4 of=./flash.bin
dd if=./program/build/bootloader/bootloader.bin bs=1 count=$(stat -c%s ./program/build/bootloader/bootloader.bin) seek=$((16#1000)) conv=notrunc of=./flash.bin
dd if=./program/build/partition_table/partition-table.bin bs=1 count=$(stat -c%s ./program/build/partition_table/partition-table.bin) seek=$((16#8000)) conv=notrunc of=./flash.bin
dd if=$1 bs=1 count=$(stat -c%s $1) seek=$((16#10000)) conv=notrunc of=./flash.bin
