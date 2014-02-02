# File:   avrnacl-20130514/smallrom/poly1305/red1305.S
# Author: Michael Hutter, Peter Schwabe
# Public Domain

.section .text

.global red1305
.type red1305 @function

//*********************************************************
// red1305
// reduces a value mod 2^133
//
// the value is separated into a lower part a_low < 2^128 
// and a higher part a_high > 2^128. Then, apply fast
// reduction: a_low+a_high+(a_high>>2).
//
// Inputs:
//    r      in register R25:R24
//    a      in register R23:R22
//
red1305:
  
  PUSH R15
  PUSH R16
  PUSH R17
  PUSH R28
  PUSH R29
  
  CLR R15                   ; zero register
  MOVW R30, R24             ; load operand address r to Z

  MOVW R26, R22             ; load operand address a_low to X
  MOVW R28, R22             ; load operand address a_high to Y
  ADIW R28, 0x10            ; add 16 to jump to the higher part
  LDI R16, 0x10             ; set word length to 16

  CLR R21                   ; clear carry register

  LD R19, Y+                ; load a_high indirect from Y 
  CBR R19, 1                ; clears first bit (LSB)
  CBR R19, 2                ; clears second bit
loop:
  CLR R17                   ; clear carry_temp register
  LD R18, X+                 ; load a_low indirect from X
  ;add a_low and a_high
  ADD R18, R19              ; add a_high to a_low (with carry)
  ADC R17, R15              ; store carry in R17
  ADD R18, R21              ; add possible carries
  CLR R21                   ; clear carry register
  ADC R21, R17              ; store possible carries in R21
  ;shifting (a_high>>2)
  MOV R20, R19              ; save old a_high byte
  LD R19, Y+                ; load a_high indirect from Y
  MOV R17, R19              ; copy a_high to temp register
  LSR R17                   ; shift LSB to carry register
  ROR R20                   ; rotate right
  LSR R17                   ; shift LSB to carry register
  ROR R20                   ; rotate right
  ADD R20, R18              ; now add it to (a_low+a_high)
  ADC R21, R15              ; add the carry to the carry register
  ST Z+, R20  

  DEC R16                   ; decrement loop index
  BRNE loop                 ; continue until R16=0
  
  LD R18, X+                 ; load a_low indirect from X
  LDI R17, 3                ; prepare mask
  AND R18, R17              ; mask out the first 2 bits
  ;add a_low and a_high
  CLR R17                   ; clear carry_temp register
  ADD R18, R19              ; add a_high to a_low (with carry)
  ADC R17, R15              ; store carry in R17
  ADD R18, R21              ; add possible carries
  CLR R21                   ; clear carry register
  ADC R21, R17              ; store possible carries in R21
  ;shifting (a_high>>2)
  LSR R19
  LSR R19
  ADD R19, R18              ; now add it to (a_low+a_high)
  ;ADC R21, R15              ; add the carry to the carry register
  ST Z+, R19  
  ;ST X+, R21  

  POP R29
  POP R28 
  POP R17 
  POP R16
  POP R15 

  RET


