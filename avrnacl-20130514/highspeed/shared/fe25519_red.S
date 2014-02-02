# File:   avrnacl-20130514/highspeed/shared/fe25519_red.S
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
  
  LD R21, X+        ; load r1  indirect from RAM
  LD R22, Y+        ; load r33 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r2  indirect from RAM
  LD R22, Y+        ; load r34 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
    
  LD R21, X+        ; load r3  indirect from RAM
  LD R22, Y+        ; load r35 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r4  indirect from RAM
  LD R22, Y+        ; load r36 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r5  indirect from RAM
  LD R22, Y+        ; load r37 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r6  indirect from RAM
  LD R22, Y+        ; load r38 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r7  indirect from RAM
  LD R22, Y+        ; load r39 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r8  indirect from RAM
  LD R22, Y+        ; load r40 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
  
  LD R21, X+        ; load r9  indirect from RAM
  LD R22, Y+        ; load r41 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r10  indirect from RAM
  LD R22, Y+        ; load r42 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r11  indirect from RAM
  LD R22, Y+        ; load r43 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r12 indirect from RAM
  LD R22, Y+        ; load r44 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r13 indirect from RAM
  LD R22, Y+        ; load r45 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r14 indirect from RAM
  LD R22, Y+        ; load r46 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r15 indirect from RAM
  LD R22, Y+        ; load r47 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r16 indirect from RAM
  LD R22, Y+        ; load r48 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r17 indirect from RAM
  LD R22, Y+        ; load r49 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r18 indirect from RAM
  LD R22, Y+        ; load r50 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r19 indirect from RAM
  LD R22, Y+        ; load r51 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r20 indirect from RAM
  LD R22, Y+        ; load r52 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
  
  LD R21, X+        ; load r21 indirect from RAM
  LD R22, Y+        ; load r53 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r22 indirect from RAM
  LD R22, Y+        ; load r54 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r23 indirect from RAM
  LD R22, Y+        ; load r55 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r24 indirect from RAM
  LD R22, Y+        ; load r56 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r25 indirect from RAM
  LD R22, Y+        ; load r57 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r26 indirect from RAM
  LD R22, Y+        ; load r58 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r27 indirect from RAM
  LD R22, Y+        ; load r59 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r28 indirect from RAM
  LD R22, Y+        ; load r60 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r29 indirect from RAM
  LD R22, Y+        ; load r61 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r30 indirect from RAM
  LD R22, Y+        ; load r62 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21
   
  LD R21, X+        ; load r31 indirect from RAM
  LD R22, Y+        ; load r63 indirect from RAM
  MUL R22, R19
  ADD R21, R23
  CLR R23
  ADC R23, R1
  ADD R21, R0
  ADC R23, R18
  ST Z+, R21

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

  LD R21, Z         ; r2
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r3
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r4
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r5
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r6
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r7
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r8
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r9
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r10
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r11
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r12
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r13
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r14
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r15
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r16
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r17
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r18
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r19
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r20
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r21
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r22
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r23
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r24
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r25
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r26
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r27
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r28
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r29
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r30
  ADC R21, R18
  ST Z+, R21

  LD R21, Z         ; r31
  ADC R21, R18
  ST Z+, R21

;  CLR R21
  ADC R18, R18      ; store carry in R18

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

  RET

