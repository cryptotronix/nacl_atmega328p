/*
 * File:   avrnacl-20130514/smallrom/test/test_poly1305.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "print.h"
#include "msgkey.h"
#include "crypto_verify_16.h"
#include "crypto_onetimeauth.h"
#include "crypto_uint16.h"

static const crypto_uint16 msg_length[20] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 16, 32, 48, 56, 64, 80, 128, 256, 512, 1024, 2048};
static const unsigned char mac[20][16] = {{0xc0, 0x4b, 0x70, 0xfd, 0x00, 0x58, 0xc3, 0x7b, 0xd4, 0xd3, 0x1c, 0xd5, 0x3f, 0xcf, 0x06, 0xf0},
  {0x8c, 0xaf, 0x5e, 0xbd, 0xec, 0x0b, 0x0f, 0xa4, 0xe6, 0x5a, 0x2b, 0x82, 0x79, 0xab, 0xe6, 0xf2},
  {0x8c, 0xf9, 0xad, 0x2c, 0xfe, 0xbb, 0x60, 0xd4, 0x3d, 0x15, 0x9c, 0xfe, 0x4a, 0x71, 0x3d, 0x11},
  {0xde, 0xfc, 0xaf, 0x31, 0x75, 0x30, 0xa0, 0x25, 0x1e, 0x12, 0xf6, 0x6a, 0x9e, 0xfc, 0xb2, 0x13},
  {0xfe, 0x2d, 0xb4, 0x9f, 0xe9, 0x1b, 0x00, 0x0e, 0x70, 0x6a, 0x7a, 0x55, 0x91, 0x8d, 0xa7, 0x01},
  {0x3f, 0x69, 0xd5, 0xa2, 0x4b, 0xbb, 0x2a, 0x52, 0xef, 0xe2, 0x90, 0x36, 0x6b, 0x82, 0x64, 0x77},
  {0x65, 0x9f, 0x03, 0x4c, 0x4f, 0xa3, 0x34, 0x5d, 0xc1, 0x16, 0xf6, 0xed, 0x9d, 0x64, 0x58, 0x9e},
  {0xbb, 0x9c, 0x7b, 0xd7, 0xb8, 0xa6, 0x60, 0x5b, 0x63, 0xa6, 0x21, 0xc9, 0x1f, 0x71, 0xea, 0xad},
  {0xd1, 0xde, 0x70, 0x17, 0x78, 0xb9, 0x65, 0x35, 0x47, 0x06, 0x6d, 0x5a, 0x72, 0x41, 0xf6, 0x28},
  {0x55, 0x21, 0x33, 0xc9, 0x90, 0x2c, 0x8b, 0x1d, 0x84, 0xc0, 0xba, 0x6a, 0xb8, 0x82, 0x4f, 0x7c},
  {0x66, 0xb7, 0xa9, 0x21, 0x4d, 0xf1, 0x4e, 0x74, 0xf1, 0xb4, 0xe0, 0x16, 0xec, 0xc8, 0x0a, 0x9a},
  {0x66, 0xe7, 0xf4, 0xde, 0x68, 0xa9, 0x1f, 0x24, 0xb7, 0xe2, 0xcc, 0x5f, 0x48, 0xe8, 0xe5, 0xf7},
  {0xe0, 0x89, 0xc5, 0xc9, 0x0a, 0xe2, 0x5a, 0x86, 0xaf, 0xbf, 0xde, 0x51, 0x16, 0xbb, 0x57, 0x8a},
  {0x8a, 0xb1, 0x7d, 0x55, 0xe4, 0xb1, 0x1e, 0x82, 0x0b, 0x34, 0x41, 0x81, 0x4a, 0xa5, 0xc7, 0x62},
  {0x03, 0x39, 0xdd, 0x41, 0xc6, 0x82, 0xf3, 0x23, 0x67, 0x8a, 0x9d, 0x19, 0xa2, 0x1a, 0x5d, 0x09},
  {0x9e, 0x0e, 0xcb, 0x0b, 0xa0, 0x5f, 0x9a, 0x8a, 0xf0, 0xe1, 0x43, 0x4b, 0xb3, 0x44, 0x8f, 0xf3},
  {0x67, 0x20, 0x9b, 0x7e, 0x27, 0x56, 0x77, 0x1f, 0xc3, 0xd0, 0xf3, 0xd1, 0x81, 0xbb, 0xb2, 0x05},
  {0x12, 0xfb, 0xea, 0x47, 0x3f, 0x0e, 0xee, 0x82, 0xb0, 0xff, 0x83, 0x1b, 0xf3, 0x5e, 0x79, 0x38},
  {0x33, 0x8b, 0xc6, 0x09, 0xe5, 0x73, 0x74, 0x19, 0x1c, 0xb7, 0x1f, 0x9d, 0xcc, 0x8a, 0x0d, 0x01},
  {0x34, 0x45, 0xe6, 0xce, 0x83, 0xc8, 0xe0, 0xd0, 0x96, 0xa6, 0x17, 0x0b, 0xf8, 0x18, 0x0a, 0x0f}};
											  
extern unsigned char msg[MAXMLEN];
extern unsigned char key[crypto_onetimeauth_KEYBYTES];
static unsigned char out[crypto_onetimeauth_BYTES];

void test_poly1305()
{
  int r,i;  
  for (i=0;i<20;i++) {
    crypto_onetimeauth(out,msg,msg_length[i],key);  
    r = crypto_verify_16(out,mac[i]);
    if(r) {
  	  print("-1\r\n");
  	  return;
    }	  
  }
  print("0\r\n");
}
