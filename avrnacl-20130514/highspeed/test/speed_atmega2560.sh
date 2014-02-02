#!/bin/sh
DEVICE=/dev/ttyACM0
DIR=`dirname $0`

avrdude -cstk500v2 -p atmega2560 -P $DEVICE -b 115200 -U flash:w:$DIR/speed_nacl_atmega2560.hex -v
stty -F $DEVICE raw icanon eof \^d 9600
echo "===== Starting Benchmarks ====="
cat < $DEVICE
