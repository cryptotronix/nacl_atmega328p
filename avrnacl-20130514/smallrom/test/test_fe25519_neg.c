/*
 * File:   avrnacl-20130514/smallrom/test/test_fe25519_neg.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "fe25519.h"
#include "randombytes.h"
#include "print.h"

void test_fe25519_neg()
{
  fe25519 fa, fr;
  int i;

  //negate random values
  randombytes(fa.v,32);
  fe25519_neg(&fr, &fa);

	print("(");
	fe25519_print(&fa);
	print("+");
	fe25519_print(&fr);
	print(") % (2^255-19)\r\n");

  //negate worst-case values
  for(i=0;i<32;i++)
    fa.v[i] = 255;
  fe25519_neg(&fr, &fa);
	print("(");
	fe25519_print(&fa);
	print("+");
	fe25519_print(&fr);
	print(") % (2^255-19)\r\n");

}
