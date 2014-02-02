/*
 * File:   avrnacl-20130514/smallrom/include/print.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef PRINT_H
#define PRINT_H

#include <stdio.h>
#include "fe25519.h"
#include "../ed25519/sc25519.h"
#include "../ed25519/ge25519.h"

void fe25519_print(const fe25519 *x);

void sc25519_print(const sc25519 *x);

void print(const char *s);

void bigint_print(const unsigned char *x, unsigned char xlen);

void serial_write(unsigned char c);

void printllu(unsigned long long);

#endif
