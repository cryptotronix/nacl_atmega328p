#!/bin/sh
DEVICE=/dev/ttyACM0
DIR=`dirname $0`

avrdude -F -V -c arduino -p ATMEGA328P -P $DEVICE -b 115200 -U flash:w:$DIR/test_cpucycles_atmega328p.hex -v
stty -F $DEVICE raw icanon eof \^d 9600
cat < $DEVICE 
