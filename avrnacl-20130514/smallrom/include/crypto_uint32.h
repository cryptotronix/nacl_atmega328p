/*
 * File:   avrnacl-20130514/smallrom/include/crypto_uint32.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef CRYPTO_UINT32_H
#define CRYPTO_UINT32_H
#ifdef __x86_64__
  typedef unsigned int crypto_uint32;
#else
  typedef unsigned long crypto_uint32;
#endif
#endif
