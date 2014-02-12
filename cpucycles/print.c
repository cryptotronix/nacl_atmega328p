#include "print.h"
#include <stdio.h>
#include <avr/io.h>

#include <util/delay.h>

#ifndef F_CPU
#warning "F_CPU is not defined, set to 16MHz per default."
#define F_CPU 16000000
#endif

#define BAUD 9600
#include <util/setbaud.h>

static char serial_initialized = 0;

void serial_init()
{
  uint16_t                        ubbr;

  /* set the baud, the traditional way */
  ubbr = 103;
  UBRR0H = ubbr >> 8;
  UBRR0L = ubbr & 0xff;

  /* Set the baud rate - the setbaud.h way */
#if 0
  UBRR0H = UBRRH_VALUE;
  UBRR0L = UBRRL_VALUE;
#endif

  /* set the framing to 8N1 */
  UCSR0C = (3 << UCSZ00);
  /* Engage! */
  UCSR0B = (1 << RXEN0) | (1 << TXEN0);

  /* doubler off  - Only needed on Uno XXX */
  //UCSR0A &= ~(1 << U2X0);

  return;
}

void serial_write(unsigned char c)
{
  if(!serial_initialized)
  {
    serial_init();
    serial_initialized = 1;
  }
  while ( !(UCSR0A & (1 << UDRE0)) );
  UDR0 = c;
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
