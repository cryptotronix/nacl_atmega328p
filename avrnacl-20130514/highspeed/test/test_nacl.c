/*
 * File:   avrnacl-20130514/highspeed/test/test_nacl.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "avr.h"
#include "print.h"

extern void test_bigint_mul136();
extern void test_bigint_mul256();
extern void test_fe25519_freeze();
extern void test_fe25519_add();
extern void test_fe25519_sub();
extern void test_fe25519_neg();
extern void test_fe25519_mul();
extern void test_fe25519_invert();
extern void test_sc25519_add();
extern void test_sc25519_mul();
extern void test_curve25519();
extern void test_ed25519();
extern void test_poly1305();
extern void test_salsa20();
extern void test_sha512();

int main()
{
  //print("111\n");
  test_bigint_mul136();
  //print("222\n");
  test_bigint_mul256();
  //print("333\n");
  test_fe25519_mul();
  //print("444\n");
  test_fe25519_freeze();
  //print("555\n");
  test_fe25519_add();
  //print("666\n");
  test_fe25519_sub();
  //print("777\n");
  test_fe25519_neg();
  //print("888\n");
  test_fe25519_invert();
  //print("999\n");
  test_sc25519_add();
  //print("111\n");
  test_sc25519_mul();
  //print("222\n");
  test_curve25519();
  //print("333\n");
  test_ed25519();
  //print("444\n");
  test_poly1305();
  //print("555\n");
  test_salsa20();
  //print("666\n");
  test_sha512();

  avr_end();
  return 0;
}

