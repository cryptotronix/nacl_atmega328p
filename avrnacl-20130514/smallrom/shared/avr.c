/*
 * File:   avrnacl-20130514/smallrom/shared/avr.c
 * Author: Michael Hutter, Peter Schwabe
 * Public Domain
 */

#include "avr.h"
#include "print.h"

#ifdef __AVR__

void avr_end()
{
  serial_write(4);
  while(1) {};
}

#else

void avr_end()
{
  ;
}

#endif
