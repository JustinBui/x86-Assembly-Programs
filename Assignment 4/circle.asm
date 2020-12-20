;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Circumference of Circle (2) 
;Programming Language: x86 Assembly
;
;General Purpose: This program asks the user to enter in a radius of a circle. It then calculates the
;                 circumference and prints out the user the answer.
;
;File Description: circle.asm asks the user to enter a floating point number representing the radius.
;                  It then uses the radius to calculate the circumference using C = 2 * pi * radius.
;
;Compile: gcc -c -g -Wall -m64 -no-pie -o circumference.o circumference.c -std=c11
;         nasm -g -F dwarf -f elf64 -o circle.o circle.asm
;Link: g++ -m64 -no-pie -o a.out -std=c++17 circumference.o circle.o 
;Execute: ./a.out
;=====================================================================================================================================
;
;
;=====================================================ABOUT THE AUTHOR================================================================
;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
;Start Date: 3 November, 2020
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
global findCircumference

section .data
    stringOutputFormat db "%s", 10, 0
    stringOutputFormat2 db "%s", 0
    intro db "This circle function is brought to you by Justin Bui.", 10, 0
    enterRadius db "Please enter the radius of a circle as a floating point number: ", 0
    floatFormat db "%lf", 0 
    numberReceived db "The number %.10lf was received", 10, 0
    circumferenceIs db "The circumference of a circle with this radius is %.19lf meters", 10, 0         ;Circumference is to be printed in 19 decimal precisions
    return db "Circumference will be returned to the main program. Please enjoy your circles", 10, 0

section .bss
    ;Nothing defined in section .bss
    
section .text
findCircumference:

    ;====================================16 PUSHES=====================================
    push rbp                                ;Backing up rbp
    mov rbp, rsp                            ;Pointing rsp to same spot as rbp 
    push rdi                                ;Backing up rdi 
    push rsi                                ;Backing up rsi 
    push rdx                                ;Backing up rdx 
    push rcx                                ;Backing up rcx 
    push r8                                 ;Backing up r8
    push r9                                 ;Backing up r9
    push r10                                ;Backing up r10
    push r11                                ;Backing up r11
    push r12                                ;Backing up r12
    push r13                                ;Backing up r13
    push r14                                ;Backing up r14
    push r15                                ;Backing up r15
    push rbx                                ;Backing up rbx
    pushf                                   ;Backing up rflags
    push rax                                ;Backing up rax
    ;==================================================================================

    ;Introducing program and author
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, intro
    call printf

    ;Prompting user to enter radius
    xor rax, rax
    mov rdi, stringOutputFormat2
    mov rsi, enterRadius
    call printf

    ;Taking user input
    push qword 0                            ;Making an extra space on stack 
    xor rax, rax            
    mov rdi, floatFormat     
    mov rsi, rsp                            ;Top of stack will have user input as it's value
    call scanf
    movsd xmm15, [rsp]                      ;Passing value of top of stack into xmm15
    pop r12                             

    ;Printing what user inputted
    push qword -1
    mov rax, 1
    mov rdi, numberReceived
    movsd xmm0, xmm15
    call printf
    pop r12

performArithmetic:
    ;====================================PERFORMING ARITHMETIC=======================================
    
    ;Circumference = 2 * pi * radius


    ;Passing in pi into an xmm register
    mov r14, 0x400921FB54442D18                ;Pi in IEEE-754
    push r14
    movsd xmm14, [rsp]
    pop r14

    ;Passing in 2.0 in xmm register
    mov r13, 0x4000000000000000                ;2.0 in IEEE-754
    push r13
    movsd xmm13, [rsp]
    pop r13

    ;Doing multiplication
    mulsd xmm15, xmm14                        ;Circumference = radius * pi
    mulsd xmm15, xmm13                        ;Circumference *= 2
    ;=====================================================================================================

    ;Printing out circumference
    push qword -999
    mov rax, 1
    mov rdi, circumferenceIs
    movsd xmm0, xmm15
    call printf
    pop r12

end:
    ;Wrapping up. Returning to the main program
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, return
    call printf

    push qword -999
    mov rax, 1
    mov rdi, circumferenceIs
    movsd xmm0, xmm15
    call printf
    pop r12

    movsd xmm0, xmm15                        ;xmm0 is what's returned in the case
                                             ;for floating point asm files

    ;====================================16 POPS=======================================
    pop rax                                 ;Restoring rax
    popf                                    ;Restoring rflags
    pop rbx                                 ;Restoring rbx
    pop r15                                 ;Restoring r15
    pop r14                                 ;Restoring r14
    pop r13                                 ;Restoring r13
    pop r12                                 ;Restoring r12
    pop r11                                 ;Restoring r11
    pop r10                                 ;Restoring r10
    pop r9                                  ;Restoring r9
    pop r8                                  ;Restoring r8
    pop rcx                                 ;Restoring rcx
    pop rdx                                 ;Restoring rdx
    pop rsi                                 ;Restoring rsi
    pop rdi                                 ;Restoring rdi
    pop rbp                                 ;Restoring rbp
    ;=====================================END OF MODULE====================================
    
    ret

