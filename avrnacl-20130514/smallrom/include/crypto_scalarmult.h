/*
 * File:   avrnacl-20130514/smallrom/include/crypto_scalarmult.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef CRYPTO_SCALARMULT_H
#define CRYPTO_SCALARMULT_H

#define crypto_scalarmult crypto_scalarmult_curve25519
#define crypto_scalarmult_base crypto_scalarmult_base_curve25519
#define crypto_scalarmult_BYTES crypto_scalarmult_curve25519_BYTES
#define crypto_scalarmult_SCALARBYTES crypto_scalarmult_curve25519_SCALARBYTES

#define crypto_scalarmult_curve25519_BYTES 32
#define crypto_scalarmult_curve25519_SCALARBYTES 32

extern int crypto_scalarmult(unsigned char *,
                             const unsigned char *,
                             const unsigned char *);

extern int crypto_scalarmult_base(unsigned char *,
                                  const unsigned char *);

#endif
