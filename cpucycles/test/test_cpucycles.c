#include <stdlib.h>
#include <util/delay.h>
#include "../avr.h"
#include "../print.h"
#include "../cpucycles.h"

#define NTIMINGS 100
  
unsigned long long t[NTIMINGS];

int main()
{
  int i;

  print("====== BEGIN CPUCYCLES TEST ======\n");

  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    _delay_ms(1);   
  }
  for(i=0;i<NTIMINGS-1;i++)
  {
    printllu(t[i+1]-t[i]);
    print(" ");
  }
  print("\n");


  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    _delay_ms(2);   
  }
  for(i=0;i<NTIMINGS-1;i++)
  {
    printllu(t[i+1]-t[i]);
    print(" ");
  }
  print("\n");


  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    _delay_ms(3);   
  }
  for(i=0;i<NTIMINGS-1;i++)
  {
    printllu(t[i+1]-t[i]);
    print(" ");
  }
  print("\n");


  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    _delay_ms(4);   
  }
  for(i=0;i<NTIMINGS-1;i++)
  {
    printllu(t[i+1]-t[i]);
    print(" ");
  }
  print("\n");


  for(i=0;i<NTIMINGS;i++)
  {
    t[i] = cpucycles();
    _delay_ms(5);   
  }
  for(i=0;i<NTIMINGS-1;i++)
  {
    printllu(t[i+1]-t[i]);
    print(" ");
  }
  print("\n");
  
  print("======  END CPUCYCLES TEST  ======\n");


  avr_end();
  return 0;
}

