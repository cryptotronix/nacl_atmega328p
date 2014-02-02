/*
 * File:   avrnacl-20130514/highspeed/include/crypto_onetimeauth.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef CRYPTO_ONETIMEAUTH_H
#define CRYPTO_ONETIMEAUTH_H

#include "crypto_uint16.h"

#define crypto_onetimeauth crypto_onetimeauth_poly1305
#define crypto_onetimeauth_verify crypto_onetimeauth_verify_poly1305
#define crypto_onetimeauth_BYTES crypto_onetimeauth_poly1305_BYTES
#define crypto_onetimeauth_KEYBYTES crypto_onetimeauth_poly1305_KEYBYTES

#define crypto_onetimeauth_poly1305_BYTES 16
#define crypto_onetimeauth_poly1305_KEYBYTES 32

int crypto_onetimeauth(unsigned char *out, const unsigned char *in, crypto_uint16 inlen, const unsigned char *k);
int crypto_onetimeauth_verify(const unsigned char *h,const unsigned char *in,crypto_uint16 inlen,const unsigned char *k);

#endif
