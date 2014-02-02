/*
 * File:   avrnacl-20130514/highspeed/shared/print.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "print.h"
#include <stdio.h>
#include <avr/io.h>

#ifndef F_CPU
#warning "F_CPU is not defined, set to 16MHz per default."
#define F_CPU 16000000
#endif

#define BAUD 9600
#include <util/setbaud.h>

#ifndef UCSRB
# ifndef UDRE
# define UDRE UDRE0
# define RXEN RXEN0
# define TXEN TXEN0
# endif
# ifdef UCSR0A /* ATmega128 */
# define UCSRA UCSR0A
# define UCSRB UCSR0B
# define UBRRL UBRR0L
# define UBRRH UBRR0H
# define UDR UDR0
# else /* ATmega8 */
# define UCSRA USR
# define UCSRB UCR
# endif
#endif
#ifndef UBRR
# define UBRR UBRRL
#endif 

static char serial_initialized = 0;

void serial_init(void)   
{
  UBRRH = UBRRH_VALUE;
  UBRRL = UBRRL_VALUE;
  /* Enable */
  UCSRB = (1 << RXEN) | (1 << TXEN);
}

void serial_write(unsigned char c)
{
  if(!serial_initialized)
  {
    serial_init();
    serial_initialized = 1;
  }
  while (!(UCSRA & (1 << UDRE))){};
  UDR = c;
}

void print(const char *s)
{
  while(*s != 0)
  {
    serial_write(*s);
    s++;
  }
}

void bigint_print(const unsigned char *x, unsigned char xlen)
{
  int i;
  char ts[15];
  print("(");
  for(i=xlen-1;i>0;i--)
  {
    sprintf(ts, "%u*2^(%d*8)+",x[i],i);
    print(ts);
  }
  sprintf(ts, "%u*2^(%d*8))",x[0],i);
  print(ts);
}


void fe25519_print(const fe25519 *x)
{
  int i;
  char ts[15];
  print("(");
  for(i=31;i>0;i--)
  {
    sprintf(ts, "%u*2^(%d*8)+",x->v[i],i);
    print(ts);
  }
  sprintf(ts, "%u*2^(%d*8))",x->v[0],i);
  print(ts);
}

void sc25519_print(const sc25519 *x)
{
  int i;
  char ts[15];
  print("(");
  for(i=31;i>0;i--)
  {
    sprintf(ts, "%u*2^(%d*8)+",x->v[i],i);
    print(ts);
  }
  sprintf(ts, "%u*2^(%d*8))",x->v[0],i);
  print(ts);
}

void printllu(unsigned long long x)
{
  char str[24];
  int i = 22;
  str[23]=0;
  while(x>0)
  {
    str[i] = (char)((x%10)+48);
    i--;
    x = x/10;
  }
  print(str+i+1);
}
