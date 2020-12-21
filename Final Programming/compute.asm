;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Gross Pay
;Programming Language: x86 Assembly
;
;General Purpose: This program asks the user to take in 2 floats: one for hours worked and 
;                 another for pay rate per hour. The gross pay is then calculated. Anything
;                 over 40 hours is considered over time, but will be added into the gross pay.
;
;File Description: compute.asm takes the user inputs and does all of the calculations.
;                  Hours worked is multiplied with pay rate to determine gross pay. However,
;                  if more than 40 hours is entered, it is considered overtime. Any hours overtime 
;                  will be calculated by 0.5 * (Hours Worked - 40.0) * Pay Rate, which is then added to 
;                  the gross pay from the regular hours. 
;
;Start Date: 14 December, 2020
;
;Compile: g++ -c -g -Wall -m64 -no-pie -o isfloat.o isfloat.cpp -std=c++17
;         gcc -c -g -Wall -m64 -no-pie -o grosspay.o grosspay.c -std=c11
;         nasm -g -F dwarf -f elf64 -o compute.o compute.asm         
;Link: g++ -m64 -no-pie -o a.out -std=c++17 grosspay.o isfloat.o compute.o  
;Execute: ./a.out
;=====================================================================================================================================
;
;
;=====================================================ABOUT THE AUTHOR================================================================
;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
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
extern atof
extern isfloat

global compute

section .data
    stringFormat db "%s", 0
    floatFormat db "%lf", 0
    pleaseEnter db "Please enter hours worked: ", 0
    pleaseEnter2 db "Please enter pay rate: ", 0
    error db "Error try again: ", 0
    finalStatement db "The total pay is $ %0.2lf", 10, 0
    shutDown db "Shut down. You may run this program again", 10, 0


section .bss
    ;Nothing is defnied here

section .text
compute:

    ;============================================16 PUSHES===============================================
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

input:
    ;==========================================INPUT HOURS=============================================

    ;Telling user to input hours worked
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, pleaseEnter
    call printf

    mov r12, 0          ;Iterator for it to go to 2
    mov r13, 1          ;Limit for input
tryAgain1:

    ;Inputting hours worked
    push qword 100
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, rsp
    call scanf

    ;Checking if is valid input
    xor rax, rax
    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid1

    mov rax, 1
    mov rdi, rsp
    call atof
    movsd xmm15, xmm0   ;Hours worked will be stored in xmm15

    pop r15             ;Pop to make up for scanf
    

    ;=========================================INPUT PAY RATE=============================================
    mov r12, 0                      ;Reset iterator


    ;Telling user to input hours worked
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, pleaseEnter2
    call printf

tryAgain2:

    ;Inputting pay rate
    push qword 100
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, rsp
    call scanf

    ;Checking if is valid input
    xor rax, rax
    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid2

    cmp r11, 0
    je invalid2

    ;Converting to float for pay rate
    mov rax, 1
    mov rdi, rsp
    call atof
    movsd xmm14, xmm0               ;Pay rate is stored in xmm14

    pop r15
    jmp arithmetic
    ;=============================================INVALID INPUTS=============================================

invalid1:
    pop rax                 ;Making up for scanf

    cmp r12, r13
    je shut

    ;Telling user it is an error
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, error
    call printf

    inc r12
    jmp tryAgain1

invalid2:
    pop rax                 ;Making up for scanf

    cmp r12, r13
    je shut

    ;Telling user it is an error
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, error
    call printf

    inc r12
    jmp tryAgain2

    ;===========================================CALCULATE============================================

arithmetic:
                        ;xmm15 is the hours worked
                        ;xmm14 is the pay rate

    mov r15, 0x4044000000000000     ;40.0
    movq xmm13, r15

    ;Comparing if it is over time
    ucomisd xmm15, xmm13
    ja overtime
    jmp nonOvertime

    ;===========================================OVERTIME============================================

overtime:
   
    ;0.5 * (Hours Worked - 40.0) * Pay Rate

    ;Calculating overtime hours
    movsd xmm11, xmm15              ;Making a copy of hours
    subsd xmm11, xmm13              ;Hours worked - 40.0
    mulsd xmm11, xmm14              ;Multiply difference by pay rate

    mov r15, 0x3FE0000000000000     ;0.5
    movq xmm12, r15                 ;Moving 0.5 into an xmm register
    mulsd xmm11, xmm12              ;multiply overtime hours by 0.5 (Cutting them in half)

    ;Calculating regular hours 40 or under
    mulsd xmm15, xmm14              ;multiply hours by pay rate
    addsd xmm15, xmm11              ;add overtime pay to gross 

    jmp end

    ;=========================================NOT OVER TIME==========================================

nonOvertime:
    ;Hours worked * pay rate
    mulsd xmm15, xmm14
    jmp end 

shut:
    ;Statement telling user shut down error
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, shutDown
    call printf

    ;Returning 0 to the driver if the program shut down
    mov r11, 0x0000000000000000
    movq xmm15, r11
    jmp return

end:
    push qword 100
    mov rax, 1
    mov rdi, finalStatement
    movsd xmm0, xmm15
    call printf
    pop rax

return:

    movsd xmm0, xmm15       ;Returning the gross pay 

    ;==============================================16 POPS=================================================
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

    ret
    
    ;===========================================END OF MODULE================================================
