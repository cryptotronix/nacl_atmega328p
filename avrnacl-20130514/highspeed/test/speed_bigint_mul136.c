/*
 * File:   avrnacl-20130514/highspeed/test/speed_bigint_mul136.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "bigint.h"
#include "cpucycles.h"

#define NTIMINGS 10

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);

void speed_bigint_mul136()
{
  unsigned long long t[NTIMINGS];
  int i;
  unsigned char r[34];
 
  // Benchmarking scalarmult_base
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    bigint_mul136(r,r,r);
  }
  print_bench("bigint_mul136",t,NTIMINGS);
}

