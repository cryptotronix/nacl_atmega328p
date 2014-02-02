/*
 * File:   avrnacl-20130514/highspeed/test/test_bigint_mul128.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "bigint.h"
#include "print.h"
#include "randombytes.h"

#define NTESTS 60

void test_bigint_mul128()
{
  unsigned char a[16], b[16], r[32];
  int i,n;

  for(n=0;n<NTESTS;n++)
  {
    //multiply random values
    randombytes(a,16);
    randombytes(b,16);
    bigint_mul128(r, a, b);

    bigint_print(a,16);
    print("*");
    bigint_print(b,16);
    print("-");
    bigint_print(r,32);
    print("\r\n");
  }

  //multiply maximal values
  for(i=0;i<16;i++)
    a[i] = b[i] = 255;
  bigint_mul128(r, a, b);

  bigint_print(a,16);
  print("*");
  bigint_print(b,16);
  print("-");
  bigint_print(r,32);
  print("\r\n");
}
