/*
 * File:   avrnacl-20130514/smallrom/test/speed_sha512.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "crypto_hash.h"
#include "cpucycles.h"
#include "msgkey.h"

#define NTIMINGS 20

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);
extern unsigned char msg[MAXMLEN];

void speed_sha512()
{
  unsigned long long t[NTIMINGS];
  unsigned char h[crypto_hash_sha512_BYTES];
  int i;
 
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_hash_sha512(h,msg,8);
  }
  print_bench("sha512 (8 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_hash_sha512(h,msg,64);
  }
  print_bench("sha512 (64 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_hash_sha512(h,msg,576);
  }
  print_bench("sha512 (576 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_hash_sha512(h,msg,1024);
  }
  print_bench("sha512 (1024 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_hash_sha512(h,msg,2048);
  }
  print_bench("sha512 (2048 bytes)",t,NTIMINGS);

}
