# File:   avrnacl-20130514/highspeed/shared/bigint_rol64.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_rol8
.type bigint_rol8, @function

//*********************************************************
// bigint_rol8
// performs a rotation operation of one 64-bit integer
//
// Inputs:
//    r      in register R25:R24
//    n      in register R23:R22   length (max. 256)
//
bigint_rol8:

  MOVW R18, R28             ; save Y register in R19:R18
  MOV R29, R22              ; save length in R29
  
  MOVW R30, R24             ; load address of r to Z
  
  LD R20, Z+                ; load r indirect from Z
  LD R21, Z+                ; load r indirect from Z
  LD R22, Z+                ; load r indirect from Z
  LD R23, Z+                ; load r indirect from Z
  LD R24, Z+                ; load r indirect from Z
  LD R25, Z+                ; load r indirect from Z
  LD R26, Z+                ; load r indirect from Z
  LD R27, Z+                ; load r indirect from Z
  SBIW R30, 8               ; jump again to the first word

loop_rol:
  CLR R28
  LSL R27
  ROL R26
  ROL R25
  ROL R24
  ROL R23
  ROL R22
  ROL R21
  ROL R20
  ROL R28                   ; rotate carry to R28
  OR R27, R28               ; add carry to MSB of R27
  DEC R29                   ; decrement loop index
  BRNE loop_rol             ; continue until R29=0

  ST Z+, R20                ; store result in Z
  ST Z+, R21                ; store result in Z
  ST Z+, R22                ; store result in Z
  ST Z+, R23                ; store result in Z
  ST Z+, R24                ; store result in Z
  ST Z+, R25                ; store result in Z
  ST Z+, R26                ; store result in Z
  ST Z+, R27                ; store result in Z 

  MOVW R28, R18             ; restore Y register

  RET
