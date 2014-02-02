/*
 * File:   avrnacl-20130514/smallrom/test/speed_salsa20.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "crypto_stream.h"
#include "cpucycles.h"
#include "msgkey.h"

#define NTIMINGS 20

extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);
extern unsigned char msg[MLEN];
extern unsigned char key[KEYLEN];
extern unsigned char nonce[NONCELEN];

void speed_salsa20()
{
  unsigned long long t[NTIMINGS];
  unsigned char s[2048];
  int i;
  
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_stream_xor(s,s,8,nonce,key);
  }
  print_bench("salsa20 (8 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_stream_xor(s,s,64,nonce,key);
  }
  print_bench("salsa20 (64 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_stream_xor(s,s,576,nonce,key);
  }
  print_bench("salsa20 (576 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_stream_xor(s,s,1024,nonce,key);
  }
  print_bench("salsa20 (1024 bytes)",t,NTIMINGS);

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_stream_xor(s,s,2048,nonce,key);
  }
  print_bench("salsa20 (2048 bytes)",t,NTIMINGS);

}

