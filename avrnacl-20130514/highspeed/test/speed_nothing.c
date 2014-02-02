/*
 * File:   avrnacl-20130514/highspeed/test/speed_nothing.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "cpucycles.h"

#define NTIMINGS 10

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);

void speed_nothing()
{
  unsigned long long t[NTIMINGS];
  int i;
 
  // Benchmarking scalarmult_base
  for(i=0;i<NTIMINGS;i++)
    t[i] = cpucycles();
  print_bench("nothing",t,NTIMINGS);
}

