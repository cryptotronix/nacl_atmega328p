/*
 * File:   avrnacl-20130514/highspeed/test/test_sc25519_add.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "../ed25519/sc25519.h"
#include "randombytes.h"
#include "print.h"

#define NTESTS 10

void test_sc25519_add()
{
  unsigned char a[32], b[32];
  sc25519 fa, fb, fr;
  int n;

  for(n=0;n<NTESTS;n++)
  {
    randombytes(a,32);
    randombytes(b,32);
    sc25519_from32bytes(&fa,a);
    sc25519_from32bytes(&fb,b);
    sc25519_add(&fr, &fa, &fb);

    print("(");
    sc25519_print(&fa);
    print("+");
    sc25519_print(&fb);
    print(")% 7237005577332262213973186563042994240857116359379907606001950938285454250989 -");
    sc25519_print(&fr);
    print("\r\n");
  }
}
