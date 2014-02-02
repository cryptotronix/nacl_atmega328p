/*
 * File:   avrnacl-20130514/smallrom/test/stack_bigint_mul256.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include <stdio.h>
#include "bigint.h"
#include "print.h"

#define SMLEN (MLEN + crypto_sign_BYTES)

#define STACK_CANARY 0x42
extern unsigned char _end; 
extern unsigned int stack_count(unsigned char canary);

char str[8];
unsigned int ctr;

unsigned char r[64],x[32],y[32];

void stack_bigint_mul256()
{
  unsigned char *p;
  unsigned char a; /* Mark the beginning of the stack */
  
  p = &a;
  while(p >= &_end)
  {
    *p = STACK_CANARY;
    p--;
  } 
  bigint_mul256(r,x,y);
  ctr = (int)&a - (int)&_end - stack_count(STACK_CANARY);
  print("bigint_mul136:   ");
  sprintf(str, "%7d", ctr);
  print(str);
  print(" bytes\r\n");
}
