/*
 * File:   avrnacl-20130514/smallrom/test/test_curve25519.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "crypto_scalarmult.h"
#include "crypto_verify_32.h"
#include "randombytes.h"
#include "print.h"
#include "msgkey.h"

unsigned char resultpoint[32] = {0x7b, 0xaa, 0xf6, 0xab, 0xf1, 0x5d, 0x88, 0x62, 0x65, 0x61, 0x09, 0x67, 0x9d, 0x8c, 0xed, 0x79, 
                                 0xc1, 0x2e, 0x30, 0xae, 0x18, 0x58, 0xfa, 0x5b, 0x71, 0xb4, 0x26, 0xb8, 0xff, 0xb2, 0x5f, 0x5e};

extern unsigned char msg[MLEN];
extern unsigned char key[KEYLEN];

void test_curve25519()
{
  unsigned char s1[32];
  unsigned char s2[32];
  unsigned char p1[32];
  unsigned char p2[32];
  
  randombytes(s1,32);
  randombytes(s2,32);

  /* Testing DH key exchange */
  crypto_scalarmult_base(p1,s1);
  crypto_scalarmult_base(p2,s2);

  crypto_scalarmult(p1,s2,p1);
  crypto_scalarmult(p2,s1,p2);

  if(crypto_verify_32(p1,p2))
    print("-1\r\n");
  else
    print("0\r\n");

  /* Testing compatibility */
  crypto_scalarmult(p1,key,msg);

  if(crypto_verify_32(p1,resultpoint))
    print("-1\r\n");
  else
    print("0\r\n");

}
