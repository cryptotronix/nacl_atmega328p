# File:   avrnacl-20130514/smallrom/shared/fe25519_red.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global fe25519_red
.type fe25519_red @function

//*********************************************************
// fe25519_red
// reduces the result modulo 2^256-38
//
// Inputs:
//    r       in register R25:R24
//    C       in register R23:R22
//
fe25519_red:
  
  PUSH R16
  
  CLR R18           ; load a zero value
  LDI R19, 38       ; load constant 38 to R19
  
  MOVW R26, R22     ; load address of t in X
  MOVW R30, R24     ; load address of r in Z
  MOVW R24, R28     ; save Y register in R24
  MOVW R28, R22     ; put address of upper half of t in Y
  ADIW R28, 32

  LD R21, X+        ; load r0  indirect from RAM
  LD R22, Y+        ; load r32 indirect from RAM
  MUL R22, R19
  ADD R21, R0
  CLR R23
  ADC R23, R1
  ST Z+, R21

  LDI R16, 31
loop_red:
  LD R21, X+        ; load r1  indirect from RAM
  LD R22, Y+        ; load r33 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21

  DEC R16
  BRNE loop_red
  
  SBIW R30, 32      ; Reset pointer to r to the beginning
  MUL R23, R19      ; Multiply carry bits by 38
  LD R21, Z
  ADD R21, R0
  CLR R23
  ADC R23, R1
  ST Z+, R21
  
  LD R21, Z         ; r1
  ADC R21, R23
  ST Z+, R21
  
  LDI R16, 30
loop_red_final:
  LD R21, Z         
  ADC R21, R18
  ST Z+, R21
  DEC R16
  BRNE loop_red_final

  ADC R18, R18      ; store carry in R21

  SBIW R30, 32      ; Reset Z to first word of r

  LD R20, Z         ; load Ri indirect from RAM
  MUL R18, R19      ; carry*38 = R1:R0 (R1 is zero)
  ADD R20, R0       ; add R21 to r0
  ST Z+, R20 
  LD R20, Z         ; handle final possible carry.
  ADC R20, R1      
  ST Z+, R20 

  MOVW R28, R24     ; restore Y register

  CLR R1  
  POP R16

  RET

