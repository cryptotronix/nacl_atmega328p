/*
 * File:   avrnacl-20130514/smallrom/test/speed_bigint_mul256.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "bigint.h"
#include "cpucycles.h"

#define NTIMINGS 10

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);

void speed_bigint_mul256()
{
  unsigned long long t[NTIMINGS];
  int i;
  unsigned char r[64];
 
  // Benchmarking scalarmult_base
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    bigint_mul256(r,r,r);
  }
  print_bench("bigint_mul256",t,NTIMINGS);
}

