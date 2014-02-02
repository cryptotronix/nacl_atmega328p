/*
 * File:   avrnacl-20130514/smallrom/test/speed_nacl.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include <stdlib.h>
#include <stdio.h>
#include "print.h"
#include "avr.h"

extern void speed_nothing();
extern void speed_empty();
extern void speed_bigint_mul136();
extern void speed_bigint_mul256();
extern void speed_fe25519_mul();
extern void speed_curve25519();
extern void speed_ed25519();
//extern void speed_salsa20();
extern void speed_poly1305();
extern void speed_sha512();

static int cmp_llu(const void *a, const void*b)
{
  if(*(unsigned long long *)a < *(unsigned long long *)b) return -1;
  if(*(unsigned long long *)a > *(unsigned long long *)b) return 1;
  return 0;
}


static unsigned long long median(unsigned long long *l, size_t llen)
{
  qsort(l,llen,sizeof(unsigned long long),cmp_llu);

  if(llen%2) return l[llen/2];
  else return (l[llen/2-1]+l[llen/2])/2;
}

void print_bench(const char *s, unsigned long long *t, unsigned int tlen)
{
  char outs[25];
  unsigned int i=0;
  while((i < 23) && (s[i] != 0))
  {
    outs[i] = s[i];
    i++;
  }
  outs[i++] = ':';
  for( ;i<24;i++)
    outs[i] = ' ';
  outs[i] = 0;
  print(outs);

  for(i=0;i<tlen-1;i++)
    t[i] = t[i+1]-t[i];
  printllu(median(t,tlen-1));
  print("\r\n");
}

int main()
{
  speed_nothing();
  speed_empty();
  speed_bigint_mul136();
  speed_bigint_mul256();
//  speed_fe25519_mul();
//  speed_salsa20();
  speed_poly1305();
  speed_sha512();
  speed_curve25519();
  speed_ed25519();

  avr_end();
  return 0;
}
