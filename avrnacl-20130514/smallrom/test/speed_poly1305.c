/*
 * File:   avrnacl-20130514/smallrom/test/speed_poly1305.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "crypto_onetimeauth.h"
#include "cpucycles.h"
#include "msgkey.h"

#define NTIMINGS 20

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);
extern unsigned char key[KEYLEN];

void speed_poly1305()
{
  unsigned long long t[NTIMINGS];
  unsigned char m[1024];
  unsigned char out[16];
  int i;
 
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_onetimeauth(out,m,8,key);
  }
  print_bench("poly1305 (8 bytes)",t,NTIMINGS);
 
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_onetimeauth(out,m,64,key);
  }
  print_bench("poly1305 (64 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_onetimeauth(out,m,576,key);
  }
  print_bench("poly1305 (576 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_onetimeauth(out,m,1024,key);
  }
  print_bench("poly1305 (1024 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_onetimeauth(out,m,2048,key);
  }
  print_bench("poly1305 (2048 bytes)",t,NTIMINGS);

}

