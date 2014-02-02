# File:   avrnacl-20130514/smallrom/shared/bigint_xor.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_xor
.type bigint_xor, @function

//*********************************************************
// bigint_xor
// XORs two big integers
//
// Inputs:
//    r      in register R25:R24
//    a      in register R23:R22
//    b      in register R21:R20
//    length in register R18 (max. number of words: 256)
//
bigint_xor:
  
  PUSH R28
  PUSH R29

  MOVW R26, R22            ; load operand address a to X
  MOVW R28, R20            ; load operand address b to Y
  MOVW R30, R24            ; load address of result to Z
    
loop:
  LD R0, X+               ; load a indirect from X
  LD R1, Y+               ; load b indirect from Y
  EOR R0, R1             ; XOR
  ST Z+, R0               ; store result in Z   
  DEC R18
  BRNE loop
    
  POP R29
  POP R28
  CLR R1

  RET

