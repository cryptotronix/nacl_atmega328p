#!/bin/sh
DEVICE=/dev/ttyACM0
DIR=`dirname $0`

avrdude -c arduino -p atmega328p -P $DEVICE -b 115200 -U flash:w:$DIR/test_nacl_atmega2560.hex -v
stty -F $DEVICE raw icanon eof \^d 9600
echo "===== Starting Test; any output means something is wrong ====="
cat < $DEVICE | sed "s/\r//" | bc | grep -v ^0$
#cat < $DEVICE
