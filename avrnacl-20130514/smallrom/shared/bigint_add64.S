# File:   avrnacl-20130514/smallrom/shared/bigint_add64.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_add64
.type bigint_add64, @function

//*********************************************************
// bigint_add64
// adds two 64-bit integers
//
// Inputs:
//    r      in register R25:R24
//    a      in register R23:R22
//    b      in register R21:R20
//    returns the carry bit in R24
//
bigint_add64:
  
  MOVW R18, R28             ; save Y register in R19:R18
  
  MOVW R26, R22             ; load operand address a to X
  MOVW R28, R20             ; load operand address b to Y
  MOVW R30, R24             ; load address of result to Z
  
  CLC                       ; clear carry flag

  LDI R24, 8
loop:
  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z
  DEC R24
  BRNE loop
  
  ADC R24, R24              ; save carry in return register R24
  
  MOVW R28, R18             ; restore Y register
  
  RET

