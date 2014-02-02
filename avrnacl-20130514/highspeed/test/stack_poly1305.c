/*
 * File:   avrnacl-20130514/highspeed/test/stack_poly1305.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include <stdio.h>
#include "crypto_onetimeauth.h"
#include "print.h"
#include "msgkey.h"

#define STACK_CANARY 0x42
extern unsigned char _end; 
extern unsigned int stack_count(unsigned char canary);

extern unsigned char msg[MLEN];
extern unsigned char key[crypto_onetimeauth_KEYBYTES];
static unsigned char out[crypto_onetimeauth_BYTES];

char str[8];
unsigned int ctr;

void stack_poly1305()
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
  crypto_onetimeauth(out,msg,MLEN,key);
  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("poly1305:        ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");
}
