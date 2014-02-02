/*
 * File:   avrnacl-20130514/highspeed/test/stack_salsa20.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include <stdio.h>
#include "crypto_stream.h"
#include "print.h"
#include "msgkey.h"

#define SMLEN (MLEN + crypto_sign_BYTES)

#define STACK_CANARY 0x42
extern unsigned char _end; 
extern unsigned int stack_count(unsigned char canary);

extern unsigned char msg[MLEN];
extern unsigned char key[KEYLEN];
extern unsigned char nonce[NONCELEN];
static unsigned char c[MLEN];


char str[8];
unsigned int ctr;

void stack_salsa20()
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
  crypto_stream_xor(c,c,MLEN,nonce,key);
  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("salsa20:         ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");
}
