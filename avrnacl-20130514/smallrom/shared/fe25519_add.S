# File:   avrnacl-20130514/smallrom/shared/fe25519_add.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global fe25519_add
.type fe25519_add, @function

//*********************************************************
// fe25519_add
// addtracts two fe25519 integers (modulo 2^256-38)
//
// Inputs:
//    r      in register R25:R24
//    a      in register R23:R22
//    b      in register R21:R20
//
fe25519_add:
  
  MOVW R26, R22             ; load operand address a to X
  MOVW R30, R24             ; load address of result to Z
  MOVW R24, R28             ; save Y register in R24
  MOVW R28, R20             ; load operand address b to Y
  
  LDI R19, 38               ; load constant 38 to R19
  LDI R18, 32               ; set loop index to 32
  CLC                       ; clear carry flag

loop:
  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z
  DEC R18                   ; decrement loop index
  BRNE loop                 ; continue until R18=0
  
  #reduce:

  CLR R21
  ADC R21, R21              ; store carry in R21

  SBIW R30, 32              ; Reset Z to first word of r

  LD R20, Z                 ; load Ri indirect from RAM
  MUL R21, R19              ; carry*38 = R1:R0 (R1 is zero)
  ADD R20, R0               
  ST Z+, R20 
  
  LDI R18, 31    
  CLR R21
loop_red:
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  DEC R18
  BRNE loop_red
  
  ADC R21, R21              ; store carry in R21

  SBIW R30, 32              ; Reset Z to first word of r

  LD R20, Z                 ; load Ri indirect from RAM
  MUL R21, R19              ; carry*38 = R1:R0 (R1 is zero)
  ADD R20, R0               ; add R21 to r0
  ST Z+, R20 

  MOVW R28, R24             ; restore Y register

  CLR R1    

  RET
