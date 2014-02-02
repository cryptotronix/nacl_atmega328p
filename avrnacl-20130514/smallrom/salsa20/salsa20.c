/*
 * File:   avrnacl-20130514/smallrom/salsa20/salsa20.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "crypto_uint16.h"
#include "crypto_stream.h"
#include "bigint.h"

#define ROUNDS 20

extern void calc_rounds(unsigned char *xj, unsigned char *out, int rounds);
extern void init_core(unsigned char *xj, const unsigned char *c, const unsigned char *k, const unsigned char *in);
int crypto_stream_xor(unsigned char *c, const unsigned char *m, crypto_uint16 mlen, const unsigned char *n, const unsigned char *k);

static const unsigned char sigma[16] = "expand 32-byte k";

int crypto_core(
        unsigned char *out,
  const unsigned char *in,
  const unsigned char *k,
  const unsigned char *c
)
{
  unsigned char xj[128];
  init_core(xj, c, k, in);      
  calc_rounds(xj, out, ROUNDS); 
  return 0;
}

int crypto_stream(
          unsigned char *c,crypto_uint16 clen,
    const unsigned char *n,
    const unsigned char *k
    )
{
  crypto_uint16 i;
  for(i=0;i<clen;i++)
    c[i] = 0;
  return crypto_stream_xor(c,c,clen,n,k);
}

int crypto_stream_xor(
        unsigned char *c,
  const unsigned char *m,crypto_uint16 mlen,
  const unsigned char *n,
  const unsigned char *k
)
{
  unsigned char in[16];
  unsigned char block[64];
  unsigned char u[8];
  unsigned char i;

  if (!mlen) return 0;

  for (i = 0;i < 8;++i) { 
    in[i] = n[i]; 
	u[i] = 0; 
  }	
  for (i = 8;i < 16;++i) in[i] = 0;
  u[0]=1; 

  while (mlen >= 64) {
    crypto_core(block,in,k,sigma);
	bigint_xor(c,m,block,64);	
	bigint_add(&(in[8]),&(in[8]),&(u[0]),8);
    mlen -= 64;
    c += 64;
    m += 64;
  }

  if (mlen) {
    crypto_core(block,in,k,sigma);
	bigint_xor(c,m,block,(int)mlen);
  }
  return 0;
}

