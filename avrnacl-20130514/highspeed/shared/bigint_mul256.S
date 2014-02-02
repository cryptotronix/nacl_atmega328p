# File:   avrnacl-20130514/highspeed/shared/bigint_mul256.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_mul256
.type bigint_mul256, @function

/**
  * bigint_mul256.S
  *
  * operand r: r25:r24
  * operand a: r23:r22
  * operand b: r21:r20
  */   
  
bigint_mul256:
  
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
  PUSH R28
  PUSH R29

  CLR R0
  
  IN R28, 0x3d              ; load address of stack pointer
  IN R29, 0x3e              ; load address of stack pointer
  SUBI R28, 68              ; subtract space for 68 bytes
  SBC R29, R0
  OUT 0x3d, R28             ; store stack pointer
  OUT 0x3e, R29             ; store stack pointer
  ADIW R28, 0x01
  
  MOVW R2, R28              ; store address of t0
  MOVW R4, R28              ; store address of t1
  LDI R18, 34
  ADD R4, R18
  ADC R5, R0
  MOVW R6, R24              ; store r in R6
  MOVW R8, R22              ; store a in R8
  MOVW R10, R20             ; store b in R10

  MOVW R30, R2              ; t0[16] = bigint_add(t0,a,a+16,16);
  MOVW R28, R22
  ADIW R28, 16
  MOVW R26, R22

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADD R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  CLR R18
  ADC R18, R18              ; save carry in register R18
  ST Z+, R18                ; store result in Z

  ;MOVW R30, R2              ; t0[33] = bigint_add(t0+17,b,b+16,16);
  MOVW R28, R20
  ADIW R28, 16
  MOVW R26, R20

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADD R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add b to a (with carry)
  ST Z+, R18                ; store result in Z

  CLR R18
  ADC R18, R18              ; save carry in register R18
  ST Z+, R18                ; store result in Z

  MOVW R24, R4
  MOVW R22, R2
  MOVW R20, R2
  LDI R18, 17
  ADD R20, R18
  ADC R21, R0
    
  CALL bigint_mul136        ; bigint_mul136(t1,t0,t0+17);
  
  MOVW R24, R6
  MOVW R22, R8
  MOVW R20, R10

  CALL bigint_mul128        ; bigint_mul128(r,a,b);

    MOVW R30, R6              ; load address of r
  ADIW R30, 32
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z+, R1
  ST Z, R1

  ;t1[33] = bigint_sub(t1,t1,r,33);
  MOVW R30, R4
  MOVW R26, R4
  MOVW R28, R6 
  
  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SUB R18, R19              ; sub a from b
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  CLR R18
  ADC R18, R18              ; save carry in register R18
  ST Z+, R18                ; store result in Z

  MOVW R24, R2
  MOVW R22, R8
  LDI R18, 16
  ADD R22, R18
  ADC R23, R1
  MOVW R20, R10
  ADD R20, R18
  ADC R21, R1

  CALL bigint_mul128        ; bigint_mul128(t0,a+16,b+16);
  MOVW R30, R2
  ADIW R30, 32
  ST Z+, R1                 ; store t0[32]=0;

  ;t1[33] = bigint_sub(t1,t1,t0,33);
  MOVW R30, R4
  MOVW R26, R4
  MOVW R28, R2 
  
  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SUB R18, R19              ; szb a from b
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  SBC R18, R19              ; sub a from b (with carry)
  ST Z+, R18                ; store result in Z

  CLR R18
  ADC R18, R18              ; save carry in register R18
  ST Z+, R18                ; store result in Z

  ;r[49] = bigint_add(r+16,r+16,t1,33);  
  MOVW R30, R6              ; load address of r
  ADIW R30, 16
  MOVW R28, R30
  MOVW R26, R4
  
  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADD R18, R19              ; add a to b
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  CLR R18
  ADC R18, R18              ; save carry in register R18
  ST Z+, R18                ; store result in Z
  

  ;t0[0] = bigint_add(r+32,r+32,t0,32);
  MOVW R30, R6              ; load address of r
  ADIW R30, 32
  MOVW R28, R30
  MOVW R26, R2
  
  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADD R18, R19              ; add a to b
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  LD R18, X+                ; load a indirect from X
  LD R19, Y+                ; load b indirect from Y
  ADC R18, R19              ; add a to b (with carry)
  ST Z+, R18                ; store result in Z

  IN R28, 0x3d              ; load address of stack pointer
  IN R29, 0x3e              ; load address of stack pointer
  LDI R18, 68
  ADD R28, R18
  ADC R29, R1
  OUT 0x3d, R28             ; restore stack pointer
  OUT 0x3e, R29             ; restore stack pointer

  POP R29
  POP R28
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
