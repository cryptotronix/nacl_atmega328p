# File:   avrnacl-20130514/highspeed/shared/bigint_not64.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_not64
.type bigint_not64, @function

//*********************************************************
// bigint_not64
// performs a NOT operation of one 64-bit integer
//
// Inputs:
//    r      in register R25:R24
//    a      in register R23:R22
//
bigint_not64:
  
  MOVW R26, R22            ; load operand address a to X
  MOVW R30, R24            ; load address of result to Z
  
  LDI R18, 0xFF            ; load ones
  
  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z

  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z

  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z

  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z

  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z

  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z

  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z

  LD R1, X+                ; load a indirect from X
  EOR R1, R18              ; performs a NOT operation
  ST Z+, R1                ; store result in Z
  
  CLR R1

  RET

