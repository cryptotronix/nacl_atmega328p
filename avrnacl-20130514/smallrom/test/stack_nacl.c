/*
 * File:   avrnacl-20130514/smallrom/test/stack_nacl.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "print.h"
#include "avr.h"

extern unsigned char _end;
extern unsigned char __stack;

extern void stack_bigint_mul256();
extern void stack_curve25519();
extern void stack_ed25519();
//extern void stack_salsa20();
extern void stack_poly1305();
extern void stack_sha512();

unsigned int stack_count(unsigned char canary)
{
  const unsigned char *p = &_end;
  unsigned int c = 0;
  while(*p == canary && p <= &__stack)
  {
    p++;
    c++;
  }
  return c;
}

int main()
{
  stack_bigint_mul256();
  //  stack_salsa20();
  stack_poly1305();
  stack_sha512();
  stack_curve25519();
  stack_ed25519();

  avr_end();
  return 0;
}
