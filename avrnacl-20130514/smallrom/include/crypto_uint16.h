/*
 * File:   avrnacl-20130514/smallrom/include/crypto_uint16.h
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#ifndef CRYPTO_UINT16_H
#define CRYPTO_UINT16_H
#ifdef __x86_64__
  typedef unsigned short crypto_uint16;
#else
  typedef unsigned int crypto_uint16;
#endif
#endif
