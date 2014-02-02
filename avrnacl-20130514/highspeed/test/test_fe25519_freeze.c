/*
 * File:   avrnacl-20130514/highspeed/test/test_fe25519_freeze.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "print.h"
#include "randombytes.h"


void test_fe25519_freeze()
{
  fe25519 x;
  int i,j;

  for(j=0;j<40;j++)
  {
    for(i=0;i<32;i++)
      x.v[i] = 255;
    x.v[0] -= j;

    print("(");
    fe25519_print(&x);
    fe25519_freeze(&x);
    print(" - ");
    fe25519_print(&x);
    print(") % (2^255-19)\r\n");

    print("(");
    fe25519_print(&x);
    print("< 2^255-19)-1\r\n");
  }

  for(j=0;j<40;j++)
  {
    for(i=0;i<31;i++)
      x.v[i] = 255;
    x.v[31] = 127;
    x.v[0] -= j;

    print("(");
    fe25519_print(&x);
    fe25519_freeze(&x);
    print(" - ");
    fe25519_print(&x);
    print(") % (2^255-19)\r\n");

    print("(");
    fe25519_print(&x);
    print("< 2^255-19)-1\r\n");
  }
}
