/*
 * File:   avrnacl-20130514/highspeed/test/speed_curve25519.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "cpucycles.h"

#include "crypto_scalarmult.h"

#define NTIMINGS 20

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);

void speed_curve25519()
{
  unsigned long long t[NTIMINGS];
  int i;
  unsigned char s1[32];
  unsigned char p1[64];
 
  // Benchmarking scalarmult_base
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_scalarmult_base(p1,s1);
  }
  print_bench("scalarmult_base",t,NTIMINGS);

  // Benchmarking scalarmult
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_scalarmult(p1,p1,s1);
  }
  print_bench("scalarmult",t,NTIMINGS);
}

