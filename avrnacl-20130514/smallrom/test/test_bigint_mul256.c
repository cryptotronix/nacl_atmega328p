/*
 * File:   avrnacl-20130514/smallrom/test/test_bigint_mul256.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "bigint.h"
#include "print.h"
#include "randombytes.h"

#define NTESTS 60

void test_bigint_mul256()
{
  unsigned char a[32], b[32], r[64];
  int i,n;

  for(n=0;n<NTESTS;n++)
  {
    //multiply random values
    randombytes(a,17);
    randombytes(b,17);
    bigint_mul256(r, a, b);

    bigint_print(a,32);
    print("*");
    bigint_print(b,32);
    print("-");
    bigint_print(r,64);
    print("\r\n");
  }

  //multiply maximal values
  for(i=0;i<32;i++)
    a[i] = b[i] = 255;
  bigint_mul256(r, a, b);

  bigint_print(a,32);
  print("*");
  bigint_print(b,32);
  print("-");
  bigint_print(r,64);
  print("\r\n");
}
