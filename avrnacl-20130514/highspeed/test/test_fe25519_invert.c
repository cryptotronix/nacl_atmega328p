/*
 * File:   avrnacl-20130514/highspeed/test/test_fe25519_invert.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "randombytes.h"
#include "print.h"

void test_fe25519_invert()
{
  fe25519 fa, fr;

  randombytes(fa.v,32);
  fe25519_invert(&fr, &fa);

  print("(");
  fe25519_print(&fa);
  print("*");
  fe25519_print(&fr);
  print("- 1) % (2^255-19)\r\n");
}
