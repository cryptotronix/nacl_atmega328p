/*
 * File:   avrnacl-20130514/smallrom/test/speed_fe25519_mul.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "cpucycles.h"

#define NTIMINGS 10

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);

void speed_fe25519_mul()
{
  unsigned long long t[NTIMINGS];
  int i;
  fe25519 a;
 
  // Benchmarking scalarmult_base
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    fe25519_mul(&a,&a,&a);
  }
  print_bench("fe25519_mul",t,NTIMINGS);
}

