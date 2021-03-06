# File:   avrnacl-20130514/smallrom/shared/bigint_ror64.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.global bigint_ror64
.type bigint_ror64, @function

//*********************************************************
// bigint_ror64
// performs a rotation operation of one 64-bit integer
//
// Inputs:
//    r      in register R25:R24
//    n      in register R23:R22   length (max. 256)
//
bigint_ror64:

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

loop_ror:
  CLR R28
  LSR R27
  ROR R26
  ROR R25
  ROR R24
  ROR R23
  ROR R22
  ROR R21
  ROR R20
  ROR R28                   ; rotate carry to R28
  OR R27, R28               ; add carry to MSB of R27
  DEC R29                   ; decrement loop index
  BRNE loop_ror             ; continue until R29=0

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
