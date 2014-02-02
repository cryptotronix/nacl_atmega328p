/*
 * File:   avrnacl-20130514/smallrom/test/test_fe25519_mul.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "print.h"
#include "randombytes.h"

#define NTESTS 10

void test_fe25519_mul()
{
  fe25519 fa, fb, fr;
  int i,n;

  for(n=0;n<NTESTS;n++)
  {
    //multiply random values
    randombytes(fa.v,32);
    randombytes(fb.v,32);
    fe25519_mul(&fr, &fa, &fb);

    print("(");
    fe25519_print(&fa);
    print("*");
    fe25519_print(&fb);
    print("-");
    fe25519_print(&fr);
    print(") % (2^255-19)\r\n");
  }

  //multiply maximal values
  for(i=0;i<32;i++)
    fa.v[i] = fb.v[i] = 255;
  fe25519_mul(&fr, &fa, &fb);

  print("(");
  fe25519_print(&fa);
  print("*");
  fe25519_print(&fb);
  print("-");
  fe25519_print(&fr);
  print(") % (2^255-19)\r\n");

  //multiply bad case for final carry
  for(i=0;i<32;i++)
    fa.v[i] = fb.v[i] = 255;
  fb.v[0] = 253;

  fe25519_mul(&fr, &fa, &fb);

  print("(");
  fe25519_print(&fa);
  print("*");
  fe25519_print(&fb);
  print("-");
  fe25519_print(&fr);
  print(") % (2^255-19)\r\n");


}
