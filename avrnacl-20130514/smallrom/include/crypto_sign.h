/*
 * File:   avrnacl-20130514/smallrom/include/crypto_sign.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef CRYPTO_SIGN_H
#define CRYPTO_SIGN_H

#define crypto_sign_keypair crypto_sign_keypair_ed25519
#define crypto_sign crypto_sign_ed25519
#define crypto_sign_open crypto_sign_open_ed25519
#define crypto_sign_SECRETKEYBYTES crypto_sign_ed25519_SECRETBYTES
#define crypto_sign_PUBLICKEYBYTES crypto_sign_ed25519_PUBLICBYTES
#define crypto_sign_BYTES crypto_sign_ed25519_BYTES

#define crypto_sign_ed25519_SECRETKEYBYTES 64
#define crypto_sign_ed25519_PUBLICKEYBYTES 32
#define crypto_sign_ed25519_BYTES 64

#include "crypto_uint16.h"

int crypto_sign_keypair(
    unsigned char *pk,
    unsigned char *sk
    );

int crypto_sign(
    unsigned char *sm,crypto_uint16 *smlen,
    const unsigned char *m,crypto_uint16 mlen,
    const unsigned char *sk
    );

int crypto_sign_open(
    unsigned char *m,crypto_uint16 *mlen,
    const unsigned char *sm,crypto_uint16 smlen,
    const unsigned char *pk
    );

#endif
