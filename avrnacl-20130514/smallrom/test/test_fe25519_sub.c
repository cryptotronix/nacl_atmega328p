/*
 * File:   avrnacl-20130514/smallrom/test/test_fe25519_sub.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "randombytes.h"
#include "print.h"

#define NTESTS 10

void test_fe25519_sub()
{
  fe25519 fa, fb, fr;
  int i,n;

  for(n=0;n<NTESTS;n++)
  {
    //subtract random values
    randombytes(fa.v,32);
    randombytes(fb.v,32);
    fe25519_sub(&fr, &fa, &fb);

    print("(");
    fe25519_print(&fa);
    print("-");
    fe25519_print(&fb);
    print("-");
    fe25519_print(&fr);
    print(") % (2^255-19)\r\n");
  }

  //subtract worst-case values
  for(i=0;i<32;i++)
  {
    fa.v[i] = 0;
    fb.v[i] = 255;
  }
  fe25519_sub(&fr, &fa, &fb);

  print("(");
  fe25519_print(&fa);
  print("-");
  fe25519_print(&fb);
  print("-");
  fe25519_print(&fr);
  print(") % (2^255-19)\r\n");
}
