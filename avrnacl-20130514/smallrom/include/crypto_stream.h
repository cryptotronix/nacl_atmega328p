/*
 * File:   avrnacl-20130514/smallrom/include/crypto_stream.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef CRYPTO_STREAM_H
#define CRYPTO_STREAM_H

#include "crypto_uint16.h"

#define crypto_stream crypto_stream_salsa20
#define crypto_stream_xor crypto_stream_xor_salsa20
#define crypto_stream_KEYBYTES crypto_stream_salsa20_KEYBYTES
#define crypto_stream_NONCEBYTES crypto_stream_salsa20_NONCEBYTES

#define crypto_stream_salsa20_KEYBYTES 32
#define crypto_stream_salsa20_NONCEBYTES 8

int crypto_stream(unsigned char *c, crypto_uint16 clen, const unsigned char *n, const unsigned char *k);
int crypto_stream_xor(unsigned char *c, const unsigned char *m, crypto_uint16 mlen, const unsigned char *n, const unsigned char *k);

#endif
