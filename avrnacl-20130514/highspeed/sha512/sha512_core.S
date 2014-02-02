# File:   avrnacl-20130514/highspeed/sha512/sha512_core.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.section .text

.global myu64_convert_bigendian
.global Ch
.global Maj
.global Sigma
.global sigma
.global M
.global expand

.type myu64_convert_bigendian, @function
.type Ch, @function
.type Maj, @function
.type Sigma, @function
.type sigma, @function
.type M, @function
.type expand, @function

/*********************************************************
 * myu64_convert_bigendian
 *
 * Inputs:
 *    r      in register R25:R24
 *    x      in register R23:R22
 *    len    in register R21:R20
 */
myu64_convert_bigendian:
 
  MOVW R18, R28             ; save Y register in R19:R18

  MOVW R28, R22             ; load address of x to Y
  MOVW R30, R24             ; load address of r to Z

  MOV R0, R20               ; copy length to R0

loop:
  
  LD R20, Y+                ; load x indirect from Y
  LD R21, Y+                ; load x indirect from Y
  LD R22, Y+                ; load x indirect from Y
  LD R23, Y+                ; load x indirect from Y
  LD R24, Y+                ; load x indirect from Y
  LD R25, Y+                ; load x indirect from Y
  LD R26, Y+                ; load x indirect from Y
  LD R27, Y+                ; load x indirect from Y
  ST Z+, R27                ; store r in Z  
  ST Z+, R26                ; store r in Z  
  ST Z+, R25                ; store r in Z  
  ST Z+, R24                ; store r in Z   
  ST Z+, R23                ; store r in Z   
  ST Z+, R22                ; store r in Z   
  ST Z+, R21                ; store r in Z   
  ST Z+, R20                ; store r in Z   

  DEC R0
  BRNE loop                 ; loop until index is zero

  MOVW R28, R18             ; restore Y register

  RET

/*********************************************************
 * Ch
 *
 * Inputs:
 *    r      in register R25:R24
 *    x      in register R23:R22
 *    y      in register R21:R20
 *    z      in register R19:R18
 *
 */
Ch:

  PUSH R2
  PUSH R3
  PUSH R16
  PUSH R17
  PUSH R28
  PUSH R29
  
  MOVW R16, R18             ; store z in R17:R16 (because R19:R18
                            ; gets modified by the subroutines)

  IN R28, 0x3d              ; load address of stack pointer
  IN R29, 0x3e              ; load address of stack pointer
  SBIW R28, 8               ; subtract space for 64-bits
  OUT 0x3d, R28             ; store stack pointer
  OUT 0x3e, R29             ; store stack pointer
  ADIW R28, 0x01

  MOVW R2, R24              ; save r
  MOVW R24, R28
  CALL bigint_and64         ; bigint_and64(t.v,x->v,y->v);
  MOVW R24, R2              ; restore r
  
  CALL bigint_not64         ; bigint_not64(r->v,x->v);

  MOVW R20, R16
  MOVW R22, R24
  CALL bigint_and64         ; bigint_and64(r->v,r->v,z->v);

  MOVW R20, R28
  CALL bigint_xor64         ; bigint_xor64(r->v,r->v,t.v);

  ADIW R28, 0x07
  OUT 0x3d, R28             ; restore stack pointer
  OUT 0x3e, R29             ; restore stack pointer
  
  POP R29
  POP R28
  POP R17
  POP R16
  POP R3
  POP R2

  RET

/*********************************************************
 * Maj
 *
 * Inputs:
 *    r      in register R25:R24
 *    x      in register R23:R22
 *    y      in register R21:R20
 *    z      in register R19:R18
 *
 */
Maj:

  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R28
  PUSH R29
  
  MOVW R6, R18              ; save z in R7:R6
  MOVW R2, R24              ; save r in R3:R2
  MOVW R4, R22              ; save x in R5:R4

  IN R28, 0x3d              ; load address of stack pointer
  IN R29, 0x3e              ; load address of stack pointer
  SBIW R28, 8               ; subtract space for 64-bits
  OUT 0x3d, R28             ; store stack pointer
  OUT 0x3e, R29             ; store stack pointer
  ADIW R28, 0x01
    
  MOVW R24, R28
  CALL bigint_and64         ; bigint_and64(t.v,x->v,y->v);
  MOVW R24, R2              ; load r
  
  MOVW R22, R20             ; load y
  MOVW R20, R6              ; load z
  CALL bigint_and64         ; bigint_and64(r->v,y->v,z->v);

  MOVW R22, R2              ; load r
  MOVW R20, R28             ; load t
  CALL bigint_xor64         ; bigint_xor64(r->v,r->v,t.v);

  MOVW R24, R28             ; load t
  MOVW R22, R4              ; load x
  MOVW R20, R6              ; load z
  CALL bigint_and64         ; bigint_and64(t.v,x->v,z->v);
  
  MOVW R24, R2              ; load r
  MOVW R22, R2              ; load r
  MOVW R20, R28             ; load t
  CALL bigint_xor64         ; bigint_xor64(r->v,r->v,t.v);
  
  ADIW R28, 0x07
  OUT 0x3d, R28             ; restore stack pointer
  OUT 0x3e, R29             ; restore stack pointer
  
  POP R29
  POP R28
  POP R7
  POP R6
  POP R5
  POP R4
  POP R3
  POP R2

  RET

/*********************************************************
 * Sigma
 *
 * Inputs:
 *    r      in register R25:R24
 *    x      in register R23:R22
 *    c1     in register R21:R20
 *    c2     in register R19:R18
 *    c3     in register R17:R16
 */
Sigma:

  PUSH R2
  PUSH R3
  PUSH R15
  PUSH R28
  PUSH R29

  MOV R17, R20              ; save c1 in R17
  MOV R15, R18              ; save c2 in R15

  MOVW R2, R24              ; save r in R3:R2
  
  IN R28, 0x3d              ; load address of stack pointer
  IN R29, 0x3e              ; load address of stack pointer
  SBIW R28, 8               ; subtract space for 64-bits
  OUT 0x3d, R28             ; store stack pointer
  OUT 0x3e, R29             ; store stack pointer
  ADIW R28, 0x01

  MOVW R30, R2              ; load address of r in Z
  MOVW R26, R22             ; load address of x in X

  LD R1, X+                 ; now copy x to r
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1

  MOVW R30, R28             ; load address of t in Z
  MOVW R26, R24             ; load address of x in X

  LD R1, X+                 ; now copy x to t
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1

  MOV R22, R17             ; load constant c1
  CALL bigint_ror64        ; bigint_ror64(r->v,c1);

  MOVW R24, R28            ; load t
  MOV R22, R15             ; load constant c2
  CALL bigint_ror64        ; bigint_ror64(t.v,c2);

  MOVW R20, R28
  MOVW R22, R2
  MOVW R24, R2
  CALL bigint_xor64        ; bigint_xor64(r->v,r->v,t.v);

  MOVW R24, R28            ; load t
  MOV R22, R16             ; load constant c3
  CALL bigint_ror64        ; bigint_ror64(t.v,c3);

  MOVW R20, R28
  MOVW R22, R2
  MOVW R24, R2
  CALL bigint_xor64        ; bigint_xor64(r->v,r->v,t.v);  

  ADIW R28, 0x07
  OUT 0x3d, R28            ; restore stack pointer
  OUT 0x3e, R29            ; restore stack pointer
  
  CLR R1
  POP R29
  POP R28
  POP R15
  POP R3
  POP R2

  RET

/*********************************************************
 * sigma
 *
 * Inputs:
 *    r      in register R25:R24
 *    x      in register R23:R22
 *    c1     in register R21:R20
 *    c2     in register R19:R18
 *    c3     in register R17:R16
 */
sigma:

  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R15
  PUSH R28
  PUSH R29

  MOV R17, R20              ; save c1 in R17
  MOV R15, R18              ; save c2 in R15

  MOVW R2, R24              ; save r in R3:R2
  MOVW R4, R22              ; save x in R5:R4
  
  IN R28, 0x3d              ; load address of stack pointer
  IN R29, 0x3e              ; load address of stack pointer
  SBIW R28, 8               ; subtract space for 64-bits
  OUT 0x3d, R28             ; store stack pointer
  OUT 0x3e, R29             ; store stack pointer
  ADIW R28, 0x01

  MOVW R30, R2              ; load address of r in Z
  MOVW R26, R22             ; load address of x in X

  LD R1, X+                 ; now copy x to r
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1

  MOVW R30, R28             ; load address of t in Z
  MOVW R26, R24             ; load address of x in X

  LD R1, X+                 ; now copy x to t
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1

  MOV R22, R17             ; load constant c1
  CALL bigint_ror64        ; bigint_ror64(r->v,c1);

  MOVW R24, R28            ; load t
  MOV R22, R15             ; load constant c2
  CALL bigint_ror64        ; bigint_ror64(t.v,c2);

  MOVW R20, R28
  MOVW R22, R2
  MOVW R24, R2
  CALL bigint_xor64        ; bigint_xor64(r->v,r->v,t.v);

  MOVW R30, R28            ; load address of t in Z
  MOVW R26, R4             ; load address of x in X

  LD R1, X+                ; now copy x to t
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1
  LD R1, X+
  ST Z+, R1

  MOVW R24, R28            ; load t
  MOV R22, R16             ; load constant c3
  CALL bigint_shr64        ; bigint_ror64(t.v,c3);

  MOVW R20, R28
  MOVW R22, R2
  MOVW R24, R2
  CALL bigint_xor64        ; bigint_xor64(r->v,r->v,t.v);  

  ADIW R28, 0x07
  OUT 0x3d, R28            ; restore stack pointer
  OUT 0x3e, R29            ; restore stack pointer
  
  CLR R1
  POP R29
  POP R28
  POP R15
  POP R5
  POP R4
  POP R3
  POP R2

  RET

/*********************************************************
 * M
 *
 * Inputs:
 *    w0     in register R25:R24
 *    w14    in register R23:R22
 *    w9     in register R21:R20
 *    w1     in register R19:R18
 */
M:

  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9
  PUSH R16
  PUSH R17
  PUSH R28
  PUSH R29

  MOVW R2, R24              ; save w0 in R2
  MOVW R4, R22              ; save w14 in R4
  MOVW R6, R20              ; save w9 in R6
  MOVW R8, R18              ; save w1 in R8
  
  IN R28, 0x3d              ; load address of stack pointer
  IN R29, 0x3e              ; load address of stack pointer
  SBIW R28, 8               ; subtract space for 64-bits
  OUT 0x3d, R28             ; store stack pointer
  OUT 0x3e, R29             ; store stack pointer
  ADIW R28, 0x01

  MOVW R24, R28
  MOVW R22, R8
  LDI R20, 1
  LDI R18, 8
  LDI R16, 7
  CALL sigma                ; sigma(&t, w1, 1, 8, 7);
  
  MOVW R24, R2              
  MOVW R22, R2
  MOVW R20, R6
  CALL bigint_add64         ; bigint_add64(w0->v, w0->v, w9->v);

  MOVW R24, R2              
  MOVW R22, R2
  MOVW R20, R28
  CALL bigint_add64         ; bigint_add64(w0->v, w0->v, t.v);
  
  MOVW R24, R28
  MOVW R22, R4
  LDI R20, 19
  LDI R18, 61
  LDI R16, 6
  CALL sigma                ; sigma(&t, w14, 19, 61, 6);

  MOVW R24, R2              
  MOVW R22, R2
  MOVW R20, R28
  CALL bigint_add64         ; bigint_add64(w0->v, w0->v, t.v);

  ADIW R28, 0x07
  OUT 0x3d, R28            ; restore stack pointer
  OUT 0x3e, R29            ; restore stack pointer

  POP R29
  POP R28
  POP R17
  POP R16
  POP R9
  POP R8
  POP R7
  POP R6
  POP R5
  POP R4
  POP R3
  POP R2

  RET

/*********************************************************
 * expand
 *
 * Inputs:
 *    w      in register R25:R24
 */
expand:

  PUSH R2
  PUSH R3
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9
  PUSH R16 
  PUSH R17
  PUSH R28
  PUSH R29

  MOVW R2, R24              ; save w in R2

  CLR R4                    ; init i1 with zero
  LDI R16, 112
  MOV R5, R16               ; init i2 with 14
  LDI R16, 72
  MOV R6, R16               ; init i3 with 9
  LDI R16, 8
  MOV R7, R16               ; init i4 with 1
  MOV R8, R16               ; load constant 8 into R8
  CLR R9                    ; load a zero constant
  LDI R17, 0x7F             ; load constant 0x7f

  LDI R16, 16               ; loop index
  
loop_exp:

  MOVW R24, R2              ; load basis address
  ADD R24, R4               ; add i1 offset
  ADC R25, R9
  MOVW R22, R2              ; load basis address
  ADD R22, R5               ; add i2 offset
  ADC R23, R9
  MOVW R20, R2              ; load basis address
  ADD R20, R6               ; add i3 offset
  ADC R21, R9
  MOVW R18, R2              ; load basis address
  ADD R18, R7               ; add i4 offset
  ADC R19, R9
  
  CALL M                    ; M(w+i1,w+i2,w+i3,w+i4);
  
  ADD R4, R8                ; R4+8
  ADD R5, R8                ; R5+8
  ADD R6, R8                ; R6+8
  ADD R7, R8                ; R7+8
  AND R4, R17
  AND R5, R17
  AND R6, R17
  AND R7, R17
  
  DEC R16
  BRNE loop_exp

  POP R29
  POP R28
  POP R17
  POP R16
  POP R9
  POP R8
  POP R7
  POP R6
  POP R5
  POP R4
  POP R3
  POP R2

  RET
