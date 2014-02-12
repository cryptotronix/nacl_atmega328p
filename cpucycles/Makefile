AVRCC = /usr/bin/avr-gcc
AVRCFLAGS_ATMEGA328p = -g -Wall -mmcu=atmega328p -O3 -I./include/ -DF_CPU=16000000
AVRCFLAGS_ATMEGA328p_SMALL = -g -Wall -mmcu=atmega328p -Os -I./include/ -DF_CPU=16000000 -mcall-prologues
AVRCFLAGS_ATMEGA2560 = -g -Wall -mmcu=atmega2560 -O3 -I./include/ -DF_CPU=16000000
AVRCFLAGS_ATMEGA2560_SMALL = -g -Wall -mmcu=atmega2560 -Os -I./include/ -DF_CPU=16000000 -mcall-prologues
AVROBJCOPY=avr-objcopy

all: test/test_cpucycles_atmega328p \

test/test_cpucycles_atmega328p: \
	obj/atmega328p/print.o \
	obj/atmega328p/cpucycles.o \
	obj/atmega328p/avr.o \
	test/test_cpucycles.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA328p) $^ -o $@
	$(AVROBJCOPY) -O ihex -R .eeprom test/test_cpucycles_atmega328p test/test_cpucycles_atmega328p.hex

obj/atmega328p/%.o: %.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA328p) -c $^ -o $@

obj/atmega328p/%.o: %.S
	$(AVRCC) $(AVRCFLAGS_ATMEGA328p) -c $^ -o $@


.PHONY: clean

clean:
	-rm test/test_cpucycles_atmega328p
	-rm test/*.hex
	-rm obj/atmega2560/*
	-rm obj/atmega328p/*
