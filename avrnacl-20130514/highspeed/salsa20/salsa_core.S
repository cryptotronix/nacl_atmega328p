# File:   avrnacl-20130514/highspeed/salsa20/salsa_core.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.section .text

.global quarterround
.global calc_rounds
.global init_core

.type quarterround, @function
.type calc_rounds, @function
.type init_core, @function


/*********************************************************
 * init_core
 *
 * Inputs:
 *    xj        in register R25:R24
 *    c         in register R23:R22 
 *    k         in register R21:R20 
 *    in        in register R19:R18
 *
 */
init_core:

  PUSH R16
  PUSH R17
  PUSH R28
  PUSH R29

  MOVW R30, R24             ; load address of x to Z
  MOVW R28, R24             ; load address of j to Y
  ADIW R28, 63
  ADIW R28, 1

  ;c + 0
  MOVW R26, R22             ; load address of c to X
  LDI R16, 4
loop_c1:

  LD R17, X+
  ST Z+, R17
  ST Y+, R17

  DEC R16
  BRNE loop_c1
  
  ;k + 0
  MOVW R26, R20             ; load address of k to X
  LDI R16, 16
loop_k1:

  LD R17, X+
  ST Z+, R17
  ST Y+, R17

  DEC R16
  BRNE loop_k1

  ;c + 4
  MOVW R26, R22             ; load address of c+4 to X
  ADIW R26, 4
  LDI R16, 4
loop_c2:

  LD R17, X+
  ST Z+, R17
  ST Y+, R17

  DEC R16
  BRNE loop_c2

  ;in + 0
  MOVW R26, R18             ; load address of in to X
  LDI R16, 16
loop_in:

  LD R17, X+
  ST Z+, R17
  ST Y+, R17

  DEC R16
  BRNE loop_in

  ;c + 8
  MOVW R26, R22             ; load address of c+8 to X
  ADIW R26, 8
  LDI R16, 4
loop_c3:

  LD R17, X+
  ST Z+, R17
  ST Y+, R17

  DEC R16
  BRNE loop_c3 

  ;k + 16
  MOVW R26, R20             ; load address of k to X
  ADIW R26, 16
  LDI R16, 16
loop_k2:

  LD R17, X+
  ST Z+, R17
  ST Y+, R17

  DEC R16
  BRNE loop_k2

  ;c + 12
  MOVW R26, R22             ; load address of c+12 to X
  ADIW R26, 12
  LDI R16, 4
loop_c4:

  LD R17, X+
  ST Z+, R17
  ST Y+, R17

  DEC R16
  BRNE loop_c4 

  POP R29
  POP R28
  POP R17
  POP R16

  RET


/*********************************************************
 * quarterround
 *
 * Inputs:
 *    y0         in register R25:R24
 *    y1         in register R23:R22
 *    y2         in register R21:R20 
 *    y3         in register R19:R18 
 *
 * Internal registers:
 *    R3:R0     stores y0 (32 bits)
 *    R7:R4     stores y1 (32 bits)
 *    R11:R8    stores y2 (32 bits)
 *    R15:R12   stores y3 (32 bits)
 *    R17:R16   stores the base address x
 *    R19:R18   stores the address of y3
 *    R21:R20   stores the address of y2
 *    R23:R22   stores the address of y1
 *    R25:R24   stores the address of y0
 */
quarterround:

  ;load the first input bytes y0, y1, and y3 (y2 is not needed yet and loaded later) (27 cycles)
  MOVW R26, R24             ; load address of y0 to X
  LD R0, X+
  LD R1, X+
  LD R2, X+
  LD R3, X+
  MOVW R26, R22             ; load address of y1 to X
  LD R4, X+
  LD R5, X+
  LD R6, X+
  LD R7, X+  
  MOVW R26, R18             ; load address of y3 to X
  LD R12, X+
  LD R13, X+
  LD R14, X+
  LD R15, X+

  ;the result should be stored in y1
  MOVW R30, R22             ; load address of y1 to Z

  ;now perform addition y0+y3 at location y2 (6 cycles)
  MOVW R8, R0               ; copy content of y0 to y2
  MOVW R10, R2              
  ADD R8, R12               
  ADC R9, R13
  ADC R10, R14
  ADC R11, R15

  ;perform rol7 and xor: y1^((y0+y3)<<<7) (27 cycles)
  MOVW R26, R8              ; save (y0+y3) in X and Y (temporarily)
  MOVW R28, R10
  LSR R26					; store bit 0 in carry
  MOV R26, R11
  ROR R26                   ; add carry to MSB
  EOR R4, R26               ; XOR first byte of y1
  ST Z+, R4                 ; store result

  LSR R27					; store bit 0 in carry
  MOV R27, R8
  ROR R27                   ; add carry to MSB
  EOR R5, R27               ; XOR second byte of y1
  ST Z+, R5                 ; store result

  LSR R28					; store bit 0 in carry
  MOV R28, R9
  ROR R28                   ; add carry to MSB
  EOR R6, R28               ; XOR third byte of y1
  ST Z+, R6                 ; store result

  LSR R29					; store bit 0 in carry
  MOV R29, R10
  ROR R29                   ; add carry to MSB
  EOR R7, R29               ; XOR fourth byte of y1
  ST Z+, R7                 ; store result

  ;the result should be stored in y2
  MOVW R30, R20             ; load address of y2 to Z

  ;now perform addition y1+y0 at location y2
  MOVW R8, R0               ; copy content of y0 to y2
  MOVW R10, R2              
  ADD R8, R4               
  ADC R9, R5
  ADC R10, R6
  ADC R11, R7

  ;perform rol9 and xor: y2^((y1+y0)<<<9) (33 cycles)
  MOVW R26, R8              ; save (y1+y0) in X and Y (temporarily)
  MOVW R28, R10
  LSL R28					; store bit 7 in carry
  ROL R29                   ; shift left and add carry to LSB
  LD R8, Z                  ; load first byte of y2
  EOR R8, R29               ; y2^((y1+y0)<<<9)
  ST Z+, R8                 ; store result
  MOVW R28, R10             ; restore (y1+y0)
  
  MOVW R20, R26             ; save value of R27:R26 in R21:R20 (needed later)
  LSL R29					; store bit 7 in carry
  ROL R26                   ; shift left and add carry to LSB
  LD R9, Z                  ; load first byte of y2
  EOR R9, R26               ; y2^((y1+y0)<<<9)
  ST Z+, R9                 ; store result
  MOV R29, R11              ; restore (y1+y0)

  LSL R20					; store bit 7 in carry
  ROL R27                   ; shift left and add carry to LSB
  LD R10, Z                 ; load first byte of y2
  EOR R10, R27              ; y2^((y1+y0)<<<9)
  ST Z+, R10                ; store result
  
  LSL R21					; store bit 7 in carry
  ROL R28                   ; shift left and add carry to LSB
  LD R11, Z                 ; load first byte of y2
  EOR R11, R28              ; y2^((y1+y0)<<<9)
  ST Z+, R11                ; store result

  ;the result should be stored in y3
  MOVW R30, R18             ; load address of y3 to Z

  ;now perform addition y1+y2 at location y1
  ADD R4, R8               
  ADC R5, R9
  ADC R6, R10
  ADC R7, R11

  ;perform rol13 and xor: y3^((y1+y2)<<<13) (29 cycles)
  LDI R18, 32               ; store the constant 32 in R18
  MOVW R26, R0              ; save R1:R0 because it is needed for MUL
  
  MUL R6, R18
  MOVW R20, R0              ; save result in R20
  MUL R7, R18
  OR R0, R21
  MOV R22, R1               ; save higher word in R22
  EOR R12, R0               ; y3^((y1+y2)<<<13)
  ST Z+, R12                ; store result

  MUL R4, R18
  OR R0, R22
  MOV R23, R1               ; save higher word in R23
  EOR R13, R0               ; y3^((y1+y2)<<<13)
  ST Z+, R13                ; store result

  MUL R5, R18
  OR R0, R23
  EOR R14, R0               ; y3^((y1+y2)<<<13)
  ST Z+, R14                ; store result

  OR R1, R20
  EOR R15, R1               ; y3^((y1+y2)<<<13)
  ST Z+, R15                ; store result
  
  ;the result should be stored in y0
  MOVW R30, R24             ; load address of y0 to Z

  ;now perform addition y2+y3 at location y1
  ADD R8, R12               
  ADC R9, R13
  ADC R10, R14
  ADC R11, R15
  
  ;perform rol18 and xor: y0^((y3+y2)<<<18) (28 cycles)
  ;note: R1:R0 has been prior saved in R27:R26
  LDI R18, 4               ; store the constant 4 in R18
  
  MUL R9, R18
  MOVW R4, R0              ; save result in R4
  MUL R10, R18
  OR R0, R5
  MOV R6, R1               ; save higher word in R6
  EOR R26, R0              ; y0^((y3+y2)<<<18)
  ST Z+, R26               ; store result

  MUL R11, R18
  OR R0, R6
  MOV R7, R1               ; save higher word in R23
  EOR R27, R0              ; y3^((y1+y2)<<<13)
  ST Z+, R27               ; store result
  
  MUL R8, R18
  OR R0, R7
  EOR R2, R0               ; y3^((y1+y2)<<<13)
  ST Z+, R2                ; store result

  OR R1, R4
  EOR R3, R1               ; y3^((y1+y2)<<<13)
  ST Z+, R3                ; store result

  RET


/*********************************************************
 * calc_rounds
 *
 * Inputs:
 *    xj        in register R25:R24
 *    out       in register R23:R22
 *    rounds    in register R21:R20
 *
 * Internal registers:
 *    R17:R16   stores the base address x
 *    R20       loop counter (is pushed on the stack)
 */
calc_rounds:

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

  PUSH R22                  ; push address of out (result) onto stack
  PUSH R23

  MOVW R16, R24             ; save address of x in R17:R16
  LSR R20                   ; init loop counter (=rounds/2)
  PUSH R20 

round_loop:  
  
  ;quarterround(&x0, &x4, &x8, &x12);
  MOVW R30, R16             ; load base address of x in Z
  MOVW R24, R30             ; store address of y0 in R25:R24
  ADIW R30, 16              ; 16 because of 32 bits (4 bytes)
  MOVW R22, R30             ; store address of y1 in R23:R22
  ADIW R30, 16
  MOVW R20, R30             ; store address of y2 in R21:R20
  ADIW R30, 16
  MOVW R18, R30             ; store address of y3 in R19:R18
  RCALL quarterround
 
  ;quarterround(&x5, &x9, &x13, &x1);
  MOVW R30, R16             ; load base address of x in Z
  ADIW R30, 4
  MOVW R18, R30             ; store address of y3 in R19:R18
  ADIW R30, 16
  MOVW R24, R30             ; store address of y0 in R25:R24
  ADIW R30, 16
  MOVW R22, R30             ; store address of y1 in R23:R22
  ADIW R30, 16
  MOVW R20, R30             ; store address of y2 in R21:R20
  RCALL quarterround

  ;quarterround(&x10, &x14, &x2, &x6);	 
  MOVW R30, R16             ; load base address of x in Z
  ADIW R30, 8
  MOVW R20, R30             ; store address of y2 in R21:R20
  ADIW R30, 16
  MOVW R18, R30             ; store address of y3 in R19:R18
  ADIW R30, 16
  MOVW R24, R30             ; store address of y0 in R25:R24
  ADIW R30, 16
  MOVW R22, R30             ; store address of y1 in R23:R22
  RCALL quarterround

  ;quarterround(&x15, &x3, &x7, &x11);	
  MOVW R30, R16             ; load base address of x in Z
  ADIW R30, 12
  MOVW R22, R30             ; store address of y1 in R23:R22
  ADIW R30, 16
  MOVW R20, R30             ; store address of y2 in R21:R20
  ADIW R30, 16
  MOVW R18, R30             ; store address of y3 in R19:R18
  ADIW R30, 16
  MOVW R24, R30             ; store address of y0 in R25:R24
  RCALL quarterround

  ;quarterround(&x0, &x1, &x2, &x3);
  MOVW R30, R16             ; load base address of x in Z
  MOVW R24, R30             ; store address of y0 in R25:R24
  ADIW R30, 4
  MOVW R22, R30             ; store address of y1 in R23:R22
  ADIW R30, 4
  MOVW R20, R30             ; store address of y2 in R21:R20
  ADIW R30, 4
  MOVW R18, R30             ; store address of y3 in R19:R18
  RCALL quarterround

  ;quarterround(&x5, &x6, &x7, &x4);
  MOVW R30, R16             ; load base address of x in Z
  ADIW R30, 16
  MOVW R18, R30             ; store address of y3 in R19:R18
  ADIW R30, 4
  MOVW R24, R30             ; store address of y0 in R25:R24
  ADIW R30, 4
  MOVW R22, R30             ; store address of y1 in R23:R22
  ADIW R30, 4
  MOVW R20, R30             ; store address of y2 in R21:R20
  RCALL quarterround

  ;quarterround(&x10, &x11, &x8, &x9);	
  MOVW R30, R16             ; load base address of x in Z
  ADIW R30, 32
  MOVW R20, R30             ; store address of y2 in R21:R20
  ADIW R30, 4
  MOVW R18, R30             ; store address of y3 in R19:R18
  ADIW R30, 4
  MOVW R24, R30             ; store address of y0 in R25:R24
  ADIW R30, 4
  MOVW R22, R30             ; store address of y1 in R23:R22
  RCALL quarterround
 
  ;quarterround(&x15, &x12, &x13, &x14);
  MOVW R30, R16             ; load base address of x in Z
  ADIW R30, 48
  MOVW R22, R30             ; store address of y1 in R23:R22
  ADIW R30, 4
  MOVW R20, R30             ; store address of y2 in R21:R20
  ADIW R30, 4
  MOVW R18, R30             ; store address of y3 in R19:R18
  ADIW R30, 4
  MOVW R24, R30             ; store address of y0 in R25:R24
  RCALL quarterround
  
  POP R20
  DEC R20
  PUSH R20
    
  BREQ finished
  RJMP round_loop

finished:
  POP R20

  POP R23                    ; load address of out (result)
  POP R22
  MOVW R26, R16              ; load base address of x in X
  MOVW R28, R16              ; load address of j in Y
  ADIW R28, 63
  ADIW R28, 1
  MOVW R30, R22              ; store address of out in Z
  
  LDI R18, 16
adder_loop:
  ; now add x and j
  LD R20, X+                 ; load x indirect from X
  LD R21, Y+                 ; load j indirect from Y
  ADD R20, R21               ; ADD x and j
  ST Z+, R20                 ; store result in Z
  
  LD R20, X+                 ; load x indirect from X
  LD R21, Y+                 ; load j indirect from Y
  ADC R20, R21               ; ADC x and j
  ST Z+, R20                 ; store result in Z

  LD R20, X+                 ; load x indirect from X
  LD R21, Y+                 ; load j indirect from Y
  ADC R20, R21               ; ADC x and j
  ST Z+, R20                 ; store result in Z

  LD R20, X+                 ; load x indirect from X
  LD R21, Y+                 ; load j indirect from Y
  ADC R20, R21               ; ADC x and j
  ST Z+, R20                 ; store result in Z

  DEC R18
  BRNE adder_loop
    
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
  CLR R1                   ; clear it before returning (calling convention)  

  RET



