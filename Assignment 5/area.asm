S;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Area of Triangle
;Programming Language: x86 Assembly
;
;General Purpose: This program asks the user to enter 3 quardword floats to represent the length of
;                 the 3 sides of a triangle. The area of the triangle will be calculated
;                 and displayed to the user.
;
;File Description: area.asm asks the user to take in 3 inputs followed by an enter, 
;                  which validates user input before mobving on.This file is also responsible 
;                  for the arithmetic calculations to find the area using Heron's formula.
;
;Compile: g++ -c -g -Wall -m64 -no-pie -o isfloat.o isfloat.cpp -std=c++17
;         gcc -c -g -Wall -m64 -no-pie -o triangle.o triangle.c -std=c11
;         nasm -g -F dwarf -f elf64 -o area.o area.asm
;Link: g++ -m64 -no-pie -o a.out -std=c++17 isfloat.o triangle.o area.o 
;Execute: ./a.out
;=====================================================================================================================================
;
;
;=====================================================ABOUT THE AUTHOR================================================================
;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
;Start Date: 10 November, 2020
;=====================================================================================================================================
;
;
;
;======================================================COPYRIGHT/LICENSING============================================================
;Copyright (C) 2020 Justin Bui
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
;version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
;=====================================================================================================================================


;==========================================================START OF MODULE============================================================
extern scanf
extern printf
extern isfloat
extern atof
global area

section .data
    enterNum db "Enter the floating point lengths of the 3 sides of your triangle", 10, 0
    side db "Side %ld: ", 0
    stringOutputFormat db "%s", 0
    floatOutputFormat db "%lf ", 0
    valuesReceived db "These values were received: ", 0
    newLine db "", 10, 10, 0
    invalid db "An invalid input was entered. Terminating", 10, 0
    negative db "Only positive values are allowed. Terminating", 10, 0
    areaIs db "The area of this triangle is %lf square meters", 10, 0
    invalidTriangle db "This is not a valid triangle. Terminating", 10, 0

section .bss
    triangle: resq 3           ;The 3 sides of the rectangle


section .text
area:

    ;============================================16 PUSHES======================================================
    push rbp                        
    mov rbp, rsp 
    push rdi 
    push rsi
    push rdx 
    push rcx
    push r8 
    push r9 
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    push rbx
    pushf
    push rax
    ;==========================================================================================================

    ;Introducing to user
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, enterNum
    call printf

    mov r15, 1              ;Indicator of which side we are on ("Side 1:", "Side 2:", or "Side: 3")
    mov r14, 0              ;Index in triangle array

takeInput:                  ;Start of loop
    cmp r15, 3
    jg viewContents

    ;==========================================ENTERING IN SIDES===============================================

    ;Stating which side
    xor rax, rax
    mov rdi, side
    mov rsi, r15
    call printf

    ;Taking user input
    push qword 0                            ;Leaing extra space on the stack 
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, rsp                            ;User enters input to be stored on top of stack
    call scanf
    ;==========================================================================================================

    ;=========================================INPUT VALIDATIONS================================================

    ;Seeing if user input is float
    xor rax, rax
    mov rdi, rsp 
    call isfloat
    cmp rax, 0                              ;Returns 1 if is a float. 0 if not a float
    je invalidInput

    ;Converting string value into float
    xor rax, rax
    mov rdi, rsp
    call atof
    movsd xmm15, xmm0                       ;Moving newly made float into another xmm for use
    pop rax                                 ;Popping to make up for the push qword in scanf block
                                            ;The xmm15 becomes the new user input after passing all validations

    ;Checking if user input is negative
    mov r13, 0
    movq xmm3, r12                          ;Setting some value to zero to compare with xmm15
    ucomisd xmm15, xmm3                     ;Comparing user input with 0
    jbe negativeInput


    movsd [triangle + r14 * 8], xmm15       ;Moving xmm15 into triangle array

    ;Jumping back to start of loop
    inc r14
    inc r15
    jmp takeInput
    ;==========================================================================================================

viewContents:
    ;====================================PRINTING USER INPUTS==================================================

    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, valuesReceived
    call printf

    mov r15, 0      ;Iterator used for startLoop

startLoop:          ;Looping 3 times to print each side of triangle
    cmp r15, 3
    je arithmetic

    ;Printing each side of triangle
    push qword 0
    mov rax, 1
    mov rdi, floatOutputFormat
    movq xmm0, [triangle + r15 * 8]
    call printf
    pop r11

    inc r15
    jmp startLoop
    ;==========================================================================================================

    ;============================IF INPUT IS NOT NUMBBER OR IS NEGATIVE========================================
invalidInput:
    
    ;Tells the user their input is invalid
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, invalid
    call printf
    pop rax                                 ;Making up to the pop from the scanf

    ;Moving 0 into xmm15 to be returned 
    mov r15, 0x0000000000000000
    movq xmm15, r15

    jmp end

negativeInput:

    ;Tells the user float is negative
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, negative
    call printf 
    
    ;Moving 0 into xmm15 to be returned 
    mov r15, 0x0000000000000000
    movq xmm15, r15

    jmp end

    ;==========================================================================================================

    ;===============================ARITHMETIC TO FIND AREA====================================================
arithmetic:

    ;---------HERON'S FORMULA------------;
    ;   s = (a + b + c)/2                ;
    ;   A = sqrt(s(s - a)(s - b)(s - c)) ;
    ;------------------------------------;

    ;New line character
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, newLine
    call printf

    ;Finding (a + b + c)
    mov r13, 0x0000000000000000         ;0.0 in IEEE-754
    movq xmm14, r13                     ;Used to take in sum of all 3 sides 
    addsd xmm14, [triangle]             ;Adding a
    addsd xmm14, [triangle + 8]         ;Adding b
    addsd xmm14, [triangle + 16]        ;Adding c

    ;sum/2 to find s
    mov r13, 0x4000000000000000         ;2.0 in IEEE-754
    push r13                            ;Popping 2 onto stack 
    movsd xmm13, [rsp]                  ;Moving top of stack onto xmm13
    pop r13                             ;Popping top of stack 
    divsd xmm14, xmm13                  ;s = xmm14

    ;Finding (s - a), storing into xmm13
    movsd xmm13, xmm14
    subsd xmm13, [triangle]
    
    ;Finding (s - b), storing into xmm12
    movsd xmm12, xmm14
    subsd xmm12, [triangle + 8]

    ;Finding (s - c), storing into xmm11
    movsd xmm11, xmm14
    subsd xmm11, [triangle + 16]

    ;Finding s(s - a)(s - b)(s - c), storing all into xmm14
    mulsd xmm14, xmm13
    mulsd xmm14, xmm12
    mulsd xmm14, xmm11

    ;Seeing if product is less than or equal to zero 
    mov r10, 0
    movq xmm10, r10                     ;Used to compare with xmm14 (Product)
    ucomisd xmm14, xmm10
    jb notTriangle

    ;Finding square root of s(s - a)(s - b)(s - c)
    sqrtsd xmm15, xmm14                 ;Storing answer into xmm15
    jmp end

notTriangle: 

    ;Tells the user this is an invalid triangle
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, invalidTriangle
    call printf

    ;Moving 0 into xmm15 to be returned 
    mov r15, 0x0000000000000000
    movq xmm15, r15

    ;==========================================================================================================

end:
    ;Printing what the area is
    push qword 99
    mov rax, 1
    mov rdi, areaIs
    movsd xmm0, xmm15
    call printf
    pop rax

    movsd xmm0, xmm15                 ;Moving final result into xmm0 to return 

    ;==========================================16 POPS========================================================
    pop rax
    popf
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    pop rbp 
    ;==============================================END OF MODULE=================================================

    ret                                 ;Returns value in xmm0 to main