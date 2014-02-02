/*
 * File:   avrnacl-20130514/smallrom/test/test_salsa20.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "crypto_stream.h"
#include "print.h"
#include "msgkey.h"
#include "crypto_uint16.h"

static const crypto_uint16 stream_length[20] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 16, 32, 48, 56, 64, 80, 128, 256, 512, 1024, 2048};
static const unsigned char stream_first[16] = {0xa3, 0xc3, 0xf0, 0xd7, 0x32, 0x2b, 0x06, 0x27, 0x7f, 0x71, 0x05, 0x90, 0x5d, 0xfd, 0x3a, 0x3e};
static const unsigned char stream_last[10][16] = {{0xa5, 0x8d, 0x5c, 0x25, 0x6a, 0xdb, 0x5b, 0xf9, 0xc9, 0x77, 0x62, 0x7e, 0xf5, 0xbd, 0x60, 0xc7},
  {0x73, 0x7d, 0x8e, 0xbd, 0x79, 0xbf, 0xde, 0x0a, 0x53, 0x87, 0x70, 0x88, 0xca, 0x53, 0x7c, 0x7d},
  {0x53, 0x87, 0x70, 0x88, 0xca, 0x53, 0x7c, 0x7d, 0xb6, 0x4a, 0xe7, 0x13, 0x2b, 0x6a, 0x5d, 0x02},
  {0xb6, 0x4a, 0xe7, 0x13, 0x2b, 0x6a, 0x5d, 0x02, 0x24, 0xaf, 0xec, 0x62, 0xb0, 0xd0, 0x60, 0xa3},
  {0xa7, 0x08, 0x1d, 0xe9, 0x2a, 0x5d, 0xdd, 0x71, 0x48, 0x30, 0xc0, 0xa0, 0x42, 0xfc, 0xdb, 0x2d},
  {0xe3, 0x2b, 0xda, 0x33, 0x93, 0xe6, 0x5e, 0x6f, 0x5b, 0x6f, 0x4e, 0xbe, 0x33, 0x87, 0x42, 0x8f},
  {0xf7, 0x75, 0x32, 0xd1, 0x33, 0xa9, 0xc3, 0xe2, 0x24, 0x3b, 0x26, 0x22, 0x1d, 0xc1, 0xbd, 0x97},
  {0x8c, 0x3f, 0xc3, 0x6f, 0xfc, 0xdc, 0x00, 0x92, 0xd7, 0x95, 0x98, 0xca, 0xdf, 0xe5, 0x3d, 0xcf},
  {0xe4, 0x7f, 0x50, 0xb8, 0x91, 0xb4, 0x97, 0xb1, 0xe8, 0xb1, 0x1d, 0x3a, 0xe5, 0x67, 0xbe, 0xea},
  {0x74, 0x94, 0xf8, 0x4a, 0xe0, 0xdc, 0xf8, 0x84, 0x5b, 0x79, 0x3e, 0x7e, 0x94, 0x80, 0x4a, 0xa7}};
	  
extern unsigned char key[KEYLEN];
extern unsigned char nonce[NONCELEN];
static unsigned char c[MAXMLEN];

void test_salsa20()
{
  int i,j;
  unsigned char t[16];

  for (i=0;i<10;i++) {
    crypto_stream(c,stream_length[i],nonce,key);	  
    for(j=0;j<stream_length[i];j++)
      if(c[j] != stream_first[j]) {
  	    print("-1\r\n");
  	    return;
  	  }		
    for(j=0;j<stream_length[i];j++)
  	  t[j] = stream_first[j];
    crypto_stream_xor(c,t,stream_length[i],nonce,key);
    for(j=0;j<stream_length[i];j++)
  	  if(c[j] != 0) {
  	    print("-1\r\n");
  	    return;
      }		
  }  
  print("0\r\n");
  
  for (i=10;i<20;i++) {
    crypto_stream(c,stream_length[i],nonce,key);	  
    for(j=0;j<16;j++)
      if(c[stream_length[i]-16+j] != stream_last[i-10][j]) {
  	    print("-1\r\n");
  	    return;
  	  }		
  }	  
  print("0\r\n");
}