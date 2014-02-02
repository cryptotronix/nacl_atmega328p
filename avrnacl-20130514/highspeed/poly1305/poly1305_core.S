# File:   avrnacl-20130514/highspeed/poly1305/poly1305_core.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.section .text

.global crypto_onetimeauth_loop

.type crypto_onetimeauth_loop, @function


/*********************************************************
 * crypto_onetimeauth_loop
 *
 * Inputs:
 *    r          in register R25:R24
 *    h          in register R23:R22
 *    hr         in register R21:R20 
 *    in         in register R19:R18 
 *    inlen      in register R17:R16 
 *
 */
crypto_onetimeauth_loop:

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

  MOVW R26, R18             ; load address of 'in' in X

  CLR R3

  ;clear h
  MOVW R30, R22             ; load address of h in Z
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3
  ST Z+, R3

  INC R3                    ; store 1 constant in R3

  MOVW R4, R20              ; save register hr
  MOVW R6, R22              ; save register h
  MOVW R8, R24              ; save register r

  ;check if inlen>0
  CPI R16, 0
  BRNE loop
  CPI R17, 0
  BRNE loop
  RJMP finish

loop:  
  CLR R1                    ; load zero constant

  ;clear hr
  MOVW R30, R4              ; load address of hr in Z
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

  ;determine j
  SUBI R16, 16
  SBC R17, R1
  ROL R1                    ; store carry in R1

  CLR R30
  SUB R30, R16
  MUL R30, R1

  LDI R30, 16               ; load constant 16
  SUB R30, R0               ; j=16-x

  ADD R16, R0               ; adjust index
  CLR R0
  ADC R17, R0
  
  MOVW R28, R4              ; load address of hr in Y
loop_init:
  LD R0, X+
  ST Y+, R0
  DEC R30
  BRNE loop_init

  ST Y+, R3

  ;bigint_add
  MOVW R28, R4              ; load address of hr in Y
  MOVW R30, R6              ; load address of h in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADD R0, R1                ; add b to a
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  LD R0, Y+                 ; load hr indirect from Y
  LD R1, Z                  ; load h indirect from Z
  ADC R0, R1                ; add b to a (with carry)
  ST Z+, R0                 ; store result in Z

  MOVW R10, R26             ; save X register
  
  MOVW R24, R4              ; load hr
  MOVW R22, R6              ; load h
  MOVW R20, R8              ; load r
  CALL bigint_mul136
 
  MOVW R24, R6              ; load h
  MOVW R22, R4              ; load hr
  CALL red1305
  MOVW R26, R10             ; restore X register

  ;check if inlen=0
  CLR R0
  OR R0, R16
  OR R0, R17
  BREQ finish

  JMP loop

finish:

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
  CLR R1

  RET
