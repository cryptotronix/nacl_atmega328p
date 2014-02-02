/*
 * File:   avrnacl-20130514/highspeed/include/crypto_hash.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef CRYPTO_HASH_H
#define CRYPTO_HASH_H

#include "crypto_uint16.h"

#define crypto_hash crypto_hash_sha512
#define crypto_hashblocks crypto_hashblocks_sha512
#define crypto_hash_BYTES crypto_hash_sha512_BYTES

#define crypto_hash_sha512_BYTES 64

int crypto_hashblocks(unsigned char *statebytes,const unsigned char *in,crypto_uint16 inlen);

int crypto_hash(unsigned char *out,const unsigned char *in,crypto_uint16 inlen);


#endif
