/*
 * File:   avrnacl-20130514/highspeed/test/speed_ed25519.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "crypto_sign.h"
#include "print.h"
#include "msgkey.h"
#include "cpucycles.h"
#include "crypto_uint16.h"

#define NTIMINGS 20
extern void print_bench(const char *s, const unsigned long long *t, unsigned int tlen);

#define SMLEN (MLEN + crypto_sign_BYTES)

extern unsigned char msg[MLEN];

unsigned char mo[SMLEN];
unsigned char sm[SMLEN];
crypto_uint16 smlen;
crypto_uint16 mlen;

void speed_ed25519()
{
  unsigned long long t[NTIMINGS];
  int i;
  unsigned char pk[32];
  unsigned char sk[64];
  
  // Benchmarking keypair
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_sign_keypair(pk, sk);
  }
  print_bench("sign_keypair",t,NTIMINGS);

  // Benchmarking sign
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_sign(sm, &smlen, msg, MLEN, sk);
  }
  print_bench("sign (59 bytes)",t,NTIMINGS);

  // Benchmarking sign_open
  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    crypto_sign_open(mo, &mlen, sm, smlen, pk);
  }
  print_bench("sign_open (59 bytes)",t,NTIMINGS);
}
