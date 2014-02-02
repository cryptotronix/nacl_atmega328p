/*
 * File:   avrnacl-20130514/smallrom/test/speed_empty.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "cpucycles.h"

#define NTIMINGS 20

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);
extern void empty();

void speed_empty()
{
  unsigned long long t[NTIMINGS];
  int i;
 
  // Benchmarking scalarmult_base
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    empty();
  } 
  print_bench("empty",t,NTIMINGS);
}

