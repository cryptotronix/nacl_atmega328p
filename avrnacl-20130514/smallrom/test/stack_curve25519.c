/*
 * File:   avrnacl-20130514/smallrom/test/stack_curve25519.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include <stdio.h>
#include "crypto_scalarmult.h"
#include "print.h"

#define STACK_CANARY 0x42
extern unsigned char _end; 
extern unsigned int stack_count(unsigned char canary);

unsigned char s1[32];
unsigned char p1[32];
unsigned char p2[32];
char str[8];
unsigned int ctr;

void stack_curve25519()
{
  unsigned char *p;
  unsigned char a; /* Mark the beginning of the stack */

  /* scalarmult */
  p = &a;
  while(p >= &_end)
  {
    *p = STACK_CANARY;
    p--;
  }
  crypto_scalarmult(p1,p2,s1);

  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("scalarmult_base: ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");


  /* scalarmult_base */
  p = &a;
  while(p >= &_end)
  {
    *p = STACK_CANARY;
    p--;
  }
  crypto_scalarmult_base(p1,s1);

  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("scalarmult:      ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");

}
