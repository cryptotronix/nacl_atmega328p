# File:   avrnacl-20130514/highspeed/shared/bigint_xor64.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_xor64
.type bigint_xor64, @function

//*********************************************************
// bigint_xor64
// XORs two 64-bit integers
//
// Inputs:
//    r      in register R25:R24
//    a      in register R23:R22
//    b      in register R21:R20
//
bigint_xor64:
  
  MOVW R18, R28            ; save Y register in R19:R18
  
  MOVW R26, R22            ; load operand address a to X
  MOVW R28, R20            ; load operand address b to Y
  MOVW R30, R24            ; load address of result to Z
  
  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z

  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z

  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z

  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z

  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z

  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z

  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z

  LD R0, X+                ; load a indirect from X
  LD R1, Y+                ; load b indirect from Y
  EOR R0, R1               ; add b to a (with carry)
  ST Z+, R0                ; store result in Z
    
  MOVW R28, R18            ; restore Y register
  CLR R1

  RET

