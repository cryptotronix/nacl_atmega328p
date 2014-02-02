/*
 * File:   avrnacl-20130514/highspeed/test/stack_ed25519.c
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

#define STACK_CANARY 0x42
extern unsigned char _end; 
extern unsigned int stack_count(unsigned char canary);

unsigned char mo[SMLEN];             /* 96 bytes */
unsigned char sm[SMLEN];             /* 96 bytes */
crypto_uint16 smlen;				     /*  8 bytes */
crypto_uint16 mlen;				     /*  8 bytes */

unsigned char pk[32];
unsigned char sk[64];

char str[8];
unsigned int ctr;

void stack_ed25519()
{
  unsigned char *p;
  unsigned char a; /* Mark the beginning of the stack */
  
  /* sign_keypair */
  p = &a;
  while(p >= &_end)
  {
    *p = STACK_CANARY;
    p--;
  } 
  crypto_sign_keypair(pk, sk);
  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("sign_keypair:    ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");

  
  /* sign */
  p = &a;
  while(p >= &_end)
  {
    *p = STACK_CANARY;
    p--;
  } 
  crypto_sign(sm, &smlen, msg, MLEN, sk);
  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("sign:            ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");


  /* sign_open */
  p = &a;
  while(p >= &_end)
  {
    *p = STACK_CANARY;
    p--;
  }
  crypto_sign_open(mo, &mlen, sm, smlen, pk);

  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("sign_open:       ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");

}
