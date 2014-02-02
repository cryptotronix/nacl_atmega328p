/*
 * File:   avrnacl-20130514/highspeed/test/stack_sha512.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include <stdio.h>
#include "crypto_hash.h"
#include "print.h"
#include "msgkey.h"

#define SMLEN (MLEN + crypto_sign_BYTES)

#define STACK_CANARY 0x42
extern unsigned char _end; 
extern unsigned int stack_count(unsigned char canary);

extern unsigned char msg[MLEN];

char str[8];
unsigned char h[64];
unsigned int ctr;

void stack_sha512()
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
  crypto_hash_sha512(h,msg,MLEN);
  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("sha512:         ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");
}
