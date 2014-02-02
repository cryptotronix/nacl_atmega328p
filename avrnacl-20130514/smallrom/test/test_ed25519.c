/*
 * File:   avrnacl-20130514/smallrom/test/test_ed25519.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include <stdio.h>
#include "crypto_sign.h"
#include "crypto_uint16.h"
#include "print.h"
#include "msgkey.h"

#define SMLEN (MLEN + crypto_sign_BYTES)

extern unsigned char msg[MLEN];

unsigned char mo[SMLEN];             /* 96 bytes */
unsigned char sm[SMLEN];             /* 96 bytes */
crypto_uint16 smlen;			 /*  8 bytes */
crypto_uint16 mlen;			 /*  8 bytes */

unsigned char pk[32];
unsigned char sk[64];

void test_ed25519()
{
  int r;

  crypto_sign_keypair(pk, sk);

  crypto_sign(sm, &smlen, msg, MLEN, sk);

  /*
  char s[8];
  for(r=0;r<32;r++)
  {
    sprintf(s, "%02x ",sm[r]);
    print(s);
  }
  print("\r\n");
  */

  /* Test valid signature */
  r = crypto_sign_open(mo, &mlen, sm, smlen, pk);
  if(r)
    print("-1\r\n");
  else
    print("0\r\n");

  /* Test with modified message */
  sm[SMLEN-1] ^= 1;
  r = crypto_sign_open(mo, &mlen, sm, smlen, pk);
  if(!r)
    print("-1\r\n");
  else
    print("0\r\n");

  /* Test with modified signature */
  sm[SMLEN-1] ^= 1;
  sm[2] ^= 1;
  r = crypto_sign_open(mo, &mlen, sm, smlen, pk);
  if(!r)
    print("-1\r\n");
  else
    print("0\r\n");
}


