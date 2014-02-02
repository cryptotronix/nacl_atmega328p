# File:   avrnacl-20130514/smallrom/shared/bigint_sub.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_sub
.type bigint_sub, @function

//*********************************************************
// bigint_sub
// subtracts two multiple-precision integers 
// Needs 20+10*(n-1)+9 clock cycles where n = #words
//
// Inputs:
//    r      in register R25:R24
//    a      in register R23:R22
//    b      in register R21:R20
//    length in register R18 (max. number of words: 256)
//    returns the borrow bit in R24
//
bigint_sub:
  
  MOVW R26, R22             ; load operand address a to X
  MOVW R30, R24             ; load address of result to Z
  MOVW R24, R28             ; save Y register in R24
  MOVW R28, R20             ; load operand address b to Y

  CLC                       ; clear carry flag

loop:
  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  SBC R20, R21              ; subtract a from b (with borrow)
  ST Z+, R20                ; store result in Z
  DEC R18                   ; decrement loop index
  BRNE loop                 ; continue until R16=0

  MOVW R28, R24             ; restore Y register

  CLR R24
  ADC R24, R24              ; save borrow in return register R24
    
  RET

