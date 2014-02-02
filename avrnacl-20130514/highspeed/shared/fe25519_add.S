# File:   avrnacl-20130514/highspeed/shared/fe25519_add.S
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
  
  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADD R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z

  LD R20, X+                ; load a indirect from X
  LD R21, Y+                ; load b indirect from Y
  ADC R20, R21              ; add b to a (with carry)
  ST Z+, R20                ; store result in Z
  
  #reduce:

  CLR R21
  ADC R21, R21              ; store carry in R21

  SBIW R30, 32              ; Reset Z to first word of r

  LD R20, Z                 ; load Ri indirect from RAM
  MUL R21, R19              ; carry*38 = R1:R0 (R1 is zero)
  ADD R20, R0               
  ST Z+, R20 

  CLR R21
  # Carry to R1
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R2
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R3
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R4
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R5
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R6
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R7
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R8
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R9
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R10
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R11
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R12
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R13
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R14
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R15
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R16
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R17
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R18
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R19
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R20
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R21
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R22
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R23
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R24
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R25
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R26
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R27
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R28
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R29
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R30
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  # Carry to R31
  LD R20, Z                 ; load r indirect from RAM
  ADC R20, R21              ; add the carry
  ST Z+, R20
  
  ADC R21, R21              ; store carry in R21

  SBIW R30, 32              ; Reset Z to first word of r

  LD R20, Z                 ; load Ri indirect from RAM
  MUL R21, R19              ; carry*38 = R1:R0 (R1 is zero)
  ADD R20, R0               ; add R21 to r0
  ST Z+, R20 

  MOVW R28, R24             ; restore Y register

  CLR R1    

  RET
