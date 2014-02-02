/*
 * File:   avrnacl-20130514/highspeed/test/test_bigint_mul136.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "bigint.h"
#include "print.h"
#include "randombytes.h"

#define NTESTS 60

void test_bigint_mul136()
{
  unsigned char a[17], b[17], r[34];
  int i,n;

  for(n=0;n<NTESTS;n++)
  {
    //multiply random values
    randombytes(a,17);
    randombytes(b,17);
    bigint_mul136(r, a, b);

    bigint_print(a,17);
    print("*");
    bigint_print(b,17);
    print("-");
    bigint_print(r,34);
    print("\r\n");
  }

  //multiply maximal values
  for(i=0;i<17;i++)
    a[i] = b[i] = 255;
  bigint_mul136(r, a, b);

  bigint_print(a,17);
  print("*");
  bigint_print(b,17);
  print("-");
  bigint_print(r,34);
  print("\r\n");
}
