/*
 * File:   avrnacl-20130514/highspeed/ed25519/sc25519.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef SC25519_H
#define SC25519_H

typedef struct 
{
  unsigned char v[32];
}
sc25519;

void sc25519_from32bytes(sc25519 *r, const unsigned char x[32]);

void sc25519_from64bytes(sc25519 *r, const unsigned char x[64]);

void sc25519_to32bytes(unsigned char r[32], const sc25519 *x);

int sc25519_iszero_vartime(const sc25519 *x);

int sc25519_lt_vartime(const sc25519 *x, const sc25519 *y);

void sc25519_add(sc25519 *r, const sc25519 *x, const sc25519 *y);

void sc25519_mul(sc25519 *r, const sc25519 *x, const sc25519 *y);

void sc25519_window4(signed char r[64], const sc25519 *s);

void sc25519_2interleave2(unsigned char r[127], const sc25519 *s1, const sc25519 *s2);

void sc25519_2interleave1(unsigned char r[255], const sc25519 *s1, const sc25519 *s2);

#endif
