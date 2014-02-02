AVRCC = /usr/bin/avr-gcc
AVRCFLAGS_ATMEGA128 = -g -Wall -mmcu=atmega328p -Os -I./include/ -DF_CPU=20000000 -mcall-prologues
AVRCFLAGS_ATMEGA2560 = -g -Wall -mmcu=atmega328p -Os -I./include/ -DF_CPU=20000000 -mcall-prologues
AVROBJCOPY=avr-objcopy
QHASM=../qhasm/qhasm-avr

all: test/test_nacl_atmega2560 \
	test/speed_nacl_atmega2560 \
	test/stack_nacl_atmega2560

test/test_nacl_atmega2560: obj/atmega2560/randombytes.o \
	obj/atmega2560/print.o \
	obj/atmega2560/avr.o \
	test/test_bigint_mul136.c \
	test/test_bigint_mul256.c \
	test/test_fe25519_freeze.c \
	test/test_fe25519_add.c \
	test/test_fe25519_sub.c \
	test/test_fe25519_neg.c \
	test/test_fe25519_mul.c \
	test/test_fe25519_invert.c \
	test/test_curve25519.c \
	test/test_sc25519_add.c \
	test/test_sc25519_mul.c \
	test/test_ed25519.c \
	test/test_poly1305.c \
	test/test_sha512.c \
	test/msgkey.c \
	test/test_nacl.c \
	obj/atmega2560/libnacl.a
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) $^ -o $@
	$(AVROBJCOPY) -O ihex -R .eeprom test/test_nacl_atmega2560 test/test_nacl_atmega2560.hex

test/speed_nacl_atmega2560: obj/atmega2560/randombytes.o \
	obj/atmega2560/print.o \
	obj/atmega2560/cpucycles.o \
	obj/atmega2560/avr.o \
	test/speed_nacl.c \
	test/speed_nothing.c \
	test/speed_empty.c \
	obj/atmega2560/empty.o \
	test/speed_bigint_mul136.c \
	test/speed_bigint_mul256.c \
	test/speed_fe25519_mul.c \
	test/speed_curve25519.c \
	test/speed_ed25519.c \
	test/speed_poly1305.c \
	test/speed_sha512.c \
	test/msgkey.c \
	obj/atmega2560/libnacl.a
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) $^ -o $@
	$(AVROBJCOPY) -O ihex -R .eeprom test/speed_nacl_atmega2560 test/speed_nacl_atmega2560.hex

test/stack_nacl_atmega2560: obj/atmega2560/randombytes.o \
	obj/atmega2560/print.o \
	obj/atmega2560/avr.o \
	test/stack_nacl.c \
	test/stack_bigint_mul256.c \
	test/stack_curve25519.c \
	test/stack_ed25519.c \
	test/stack_poly1305.c \
	test/stack_sha512.c \
	test/msgkey.c \
	obj/atmega2560/libnacl.a
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) $^ -o $@
	$(AVROBJCOPY) -O ihex -R .eeprom test/stack_nacl_atmega2560 test/stack_nacl_atmega2560.hex


obj/atmega2560/%.o: curve25519/%.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: ed25519/%.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: poly1305/%.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: poly1305/%.S
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: salsa20/%.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: sha512/%.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: sha512/%.S
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: salsa20/%.S
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/fe25519_invert.o:  shared/fe25519_invert.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/fe25519_pow2523.o: shared/fe25519_pow2523.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: shared/%.c
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: shared/%.S
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

obj/atmega2560/%.o: shared/%.s
	$(AVRCC) $(AVRCFLAGS_ATMEGA2560) -c $^ -o $@

%.q: gen_%.py
	$^ > $@

%.s: %.q
	$(QHASM) < $^ > $@
	#obj/atmega2560/bigint_mul136.o \
	#obj/atmega2560/bigint_mul256.o \

obj/atmega2560/libnacl.a: \
	obj/atmega2560/bigint_cmov.o \
	obj/atmega2560/bigint_mul.o \
	obj/atmega2560/bigint_mul136.o \
	obj/atmega2560/bigint_mul256.o \
	obj/atmega2560/bigint_add.o \
	obj/atmega2560/bigint_add64.o \
	obj/atmega2560/bigint_and64.o \
	obj/atmega2560/bigint_not64.o \
	obj/atmega2560/bigint_xor64.o \
	obj/atmega2560/bigint_shr64.o \
	obj/atmega2560/bigint_ror64.o \
	obj/atmega2560/bigint_rol64.o \
	obj/atmega2560/bigint_sub.o \
	obj/atmega2560/bigint_xor.o \
	obj/atmega2560/fe25519.o \
	obj/atmega2560/fe25519_add.o \
	obj/atmega2560/fe25519_sub.o \
	obj/atmega2560/fe25519_red.o \
	obj/atmega2560/fe25519_invert.o \
	obj/atmega2560/fe25519_pow2523.o \
	obj/atmega2560/ge25519.o \
	obj/atmega2560/sc25519.o \
	obj/atmega2560/curve25519.o \
	obj/atmega2560/ed25519.o \
	obj/atmega2560/crypto_hash_sha512.o \
	obj/atmega2560/sha512_core.o \
	obj/atmega2560/poly1305.o \
	obj/atmega2560/poly1305_core.o \
	obj/atmega2560/red1305.o \
	obj/atmega2560/salsa20.o \
	obj/atmega2560/salsa_core.o \
	obj/atmega2560/crypto_verify_16.o \
	obj/atmega2560/crypto_verify_32.o
	ar cr obj/atmega2560/libnacl.a $^

.PHONY: clean

clean:
	-rm shared/bigint_add.s
	-rm shared/bigint_sub.s
	-rm shared/bigint_mul136.s
	-rm shared/bigint_mul256.s
	-rm test/test_nacl_atmega2560
	-rm test/test_nacl_atmega2560.hex
	-rm test/speed_nacl_atmega2560
	-rm test/speed_nacl_atmega2560.hex
	-rm test/stack_nacl_atmega2560
	-rm test/stack_nacl_atmega2560.hex
	-rm obj/atmega2560/*
