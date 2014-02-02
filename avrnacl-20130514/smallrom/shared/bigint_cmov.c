/*
 * File:   avrnacl-20130514/smallrom/shared/bigint_cmov.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "bigint.h"

void bigint_cmov(unsigned char *r, const unsigned char *x, unsigned char b, unsigned char len)
{
  unsigned char i;
  unsigned char mask = b;
  mask = -mask;
  for(i=0;i<len;i++)
    r[i] ^= mask & (x[i] ^ r[i]);
}

