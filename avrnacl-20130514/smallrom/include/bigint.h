/*
 * File:   avrnacl-20130514/smallrom/include/bigint.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef BIGINT_H
#define BIGINT_H

/* Arithmetic on big integers represented as arrays of unsigned char */

extern char bigint_add(unsigned char* r, const unsigned char* a, const unsigned char* b, int length);

extern char bigint_xor(unsigned char* r, const unsigned char* a, const unsigned char* b, int length);

extern char bigint_add64(unsigned char* r, const unsigned char* a, const unsigned char* b);

extern char bigint_and64(unsigned char* r, const unsigned char* a, const unsigned char* b);

extern char bigint_xor64(unsigned char* r, const unsigned char* a, const unsigned char* b);

extern char bigint_not64(unsigned char* r, const unsigned char* a);

extern char bigint_rol64(unsigned char* r, unsigned char length);

extern char bigint_ror64(unsigned char* r, unsigned char length);

extern char bigint_shr64(unsigned char* r, unsigned char length);

extern char bigint_sub(unsigned char* r, const unsigned char* a, const unsigned char* b, int length);

extern void bigint_mul(unsigned char* r, const unsigned char* a, const unsigned char* b, int length);

extern void bigint_mul128(unsigned char* r, const unsigned char* a, const unsigned char* b);

extern void bigint_mul136(unsigned char* r, const unsigned char* a, const unsigned char* b);

extern void bigint_mul256(unsigned char* r, const unsigned char* a, const unsigned char* b);

void bigint_cmov(unsigned char *r, const unsigned char *x, unsigned char b, unsigned char len);

#endif
