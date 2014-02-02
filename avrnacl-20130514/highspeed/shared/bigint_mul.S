# File:   avrnacl-20130514/highspeed/shared/bigint_mul.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_mul
.type bigint_mul, @function

/**
  * asm_bigint_mul_prodscan.S
  * Product Scanning Multiplication (looped) on an 8-bit AVR  (ATmega128)
  *
  * operand r: r25:r24
  * operand a: r23:r22
  * operand b: r21:r20
  * length:    r18
  */   
  
bigint_mul:
  
  PUSH R2 
  PUSH R3 
  PUSH R4 
  PUSH R5 
  PUSH R6 
  PUSH R7 
  PUSH R8 
  PUSH R9 
  PUSH R10
  PUSH R11
  PUSH R12
  PUSH R13
  PUSH R14
  PUSH R15
  PUSH R16
  PUSH R17
  PUSH R28
  PUSH R29
  
  ;X<-r
  MOVW R26, R24
  
  MOV R15, R18
  CLR R6
  CLR R7
  CLR R8
  LDI R16, 0x01
  LDI R17, 0x01
  CLR R9
  
  ADD R20, R15
  ADC R21, R9
  ADD R20, R16
  ADC R21, R9
  
loop1_i:
  MOVW R28, R22
  MOVW R30, R20
  SUB R30, R15
  SBC R31, R9
loop1_j:
  LD R0, Y+
  LD R1, -Z
  MUL R1, R0
  ADD R6, R0
  ADC R7, R1
  ADC R8, R9
  
  DEC R17
  BRNE loop1_j
  
  ST X+, R6
  MOV R6, R7
  MOV R7, R8
  CLR R8
  
  INC R16
  MOV R17, R16
  
  DEC R15
  BRNE loop1_i
  
  MOV R16, R18
  MOV R11, R22
  ADD R11, R18
  DEC R16
  SUBI R20, 1
  SBC R21, R9
  CLR R3
  INC R3
loop2_i:
  ADD R22, R3
  ADC R23, R9
  MOVW R28, R22
  MOVW R30, R20
loop2_j:
  LD R0, Y+
  LD R1, -Z
  MUL R1, R0
  ADD R6, R0
  ADC R7, R1
  ADC R8, R9
  
  CP R28, R11
  BRNE loop2_j
  
  ST X+, R6
  MOV R6, R7
  MOV R7, R8
  CLR R8
  
  DEC R16
  BRNE loop2_i
  
  ST X, R6
  
  CLR R1
  POP R29
  POP R28
  POP R17
  POP R16
  POP R15
  POP R14
  POP R13
  POP R12
  POP R11
  POP R10
  POP R9 
  POP R8 
  POP R7 
  POP R6 
  POP R5 
  POP R4 
  POP R3 
  POP R2 

  RET
