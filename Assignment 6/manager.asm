;====================================================PROGRAM INFORMATION==============================================================
;Program Name: The Harmonic Sum
;Programming Language: x86 Assembly
;
;General Purpose: This program takes asks the user to enter in a number. The harmonic sum
;                 is calculated and displayed using n as the user input.
;
;File Description: manager.asm manages everything. It asks the user for input and uses
;                  loops to calculate the harmonic sum. At the same time, it determines
;                  the run-time before and after the calculation by tics which is then converted
;                  to seconds.
;
;Compile: g++ -c -g -Wall -m64 -no-pie -o main.o main.cpp -std=c++17
;         nasm -g -F dwarf -f elf64 -o manager.o manager.asm
;         nasm -g -F dwarf -f elf64 -o read_clock.o read_clock.asm
;         nasm -g -F dwarf -f elf64 -o getfrequency.o getfrequency.asm
;Link: g++ -m64 -no-pie -o a.out -std=c++17 main.o manager.o read_clock.o getfrequency.o 
;Execute: ./a.out
;=====================================================================================================================================
;
;
;=====================================================ABOUT THE AUTHOR================================================================
;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
;Start Date: 29 November, 2020
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
extern get_tics
extern atof
extern getfreq
global harmonic_sum

section .data

    progress db "%8.0lf %30.13lf",10, 0
    enterTerms db "Please enter the number of terms to be included in the sum: ", 0
    stringOutputFormat db "%s", 0
    floatOutputFormat db "%lf", 0
    tics db "The clock is now %ld tics and the computation will begin", 10, 10, 0
    tics2 db 10, "The clock is now %ld tics.", 10, 0
    title db "Terms completed", 9, 9, "Harmonic Sum", 10, 0
    elapsedTime db "The elapsed time was %.0lf tics, which equals %0.16lf seconds", 10, 0
    returnToDriver db 10, "The harmonic sum will be returned to the driver", 10, 10, 0


section .bss
    ;Nothing defnined in section .bss

section .text
harmonic_sum:

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

    ;====================================TAKING INPUT FOR SUM==================================================
    ;Asking user for input of harmonic sum
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, enterTerms
    call printf

    ;Call scanf using floating point format
    push qword 0
    mov rax, 1
    mov rdi, floatOutputFormat
    mov rsi, rsp
    call scanf
    movsd xmm15, [rsp]                      ;User input stored in xmm15
    pop r15                 

    ;======================================GET RUN TIME BEFORE================================================

    ;Counting tics before calculation
    xor rax, rax
    call get_tics
    mov r14, rax                            ;Storing number of tics in r14

    ;Stating initial number of tics
    xor rax, rax
    mov rdi, tics
    mov rsi, r14
    call printf

    ;=========================================DEFINE VARIABLES==================================================

    ;Total calculated on Harmonic Sum
    push qword 0x0000000000000000           ;0.0 pushed onto the stack 
    movsd xmm14, [rsp]                      ;Top of stack is put into xmm14
    pop rax

    ;Finding segment size (When printing "Terms Completed" column)
    mov r11, 0x4024000000000000             ;10.0
    push r11                                ;Pushing 10.0 onto the stack 
    movsd xmm13, xmm15                      ;Making another copy of user input (xmm15)
    divsd xmm13, [rsp]                      ;Dividing copy of user input by 10
    roundsd xmm13, xmm13, 0                 ;Rounding quotient. Storing this into xmm13
    pop rax

    ;Current segment to be printed
    movsd xmm10, xmm13  

    ;Iterator for the loop 
    mov r12, 0x3ff0000000000000             ;1.0            
    movq xmm12, r12

    ;=========================================CALCULATE HARMONIC SUM===========================================

                        ;--------Equation:------;
                        ;       __n__           ;
                        ;       \     1         ;
                        ;       /    ---        ;
                        ;      /____  i         ;
                        ;       i = 1           ;
                        ;-----------------------;

    ;Displaying title of the table
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, title 
    call printf

startLoop:

    ;Numerator for Harmonic Sum on 1/n
    mov r11, 0x3ff0000000000000             ;1.0 
    movq xmm11, r11

    divsd xmm11, xmm12                       ;Dividng 1 by iterator 
    addsd xmm14, xmm11                       ;Adding quotient to total 
  
    ;If iterator reached the user input, print results 
    ucomisd xmm12, xmm15                         
    je printCompleted

    ;Also print results if reached the next segment during calculation
    ucomisd xmm12, xmm10                        
    je printCompleted

continueLoop:

    ;Incrementing xmm12 iterator by 1.0
    mov r11, 0x3ff0000000000000            
    push r11                               
    addsd xmm12, [rsp]                     
    pop rax

    jmp startLoop

    ;=========================================PRINT CONTENTS TO CHART===========================================
printCompleted:

    ;Printing numbers onto chart
    push qword 0
    mov rax, 1
    mov rdi, progress
    movsd xmm0, xmm12
    movsd xmm1, xmm14
    call printf 
    pop rax

    addsd xmm10, xmm13                      ;Updating segment to be printed next

    ;If the last number within the loop was already printed
    ucomisd xmm12, xmm15
    je endLoop

    jmp continueLoop

    ;======================================GET RUN TIME AFTER==================================================
endLoop:

    ;Getting number of tics after looping
    xor rax, rax
    call get_tics
    mov r15, rax

    ;Printing number of tics after looping
    xor rax, rax
    mov rdi, tics2
    mov rsi, r15
    call printf

    ;======================================CALCULATE ELAPSED TIME================================================

    ;Elapsed time in tics
    cvtsi2sd xmm15, r15                         ;Converting final tics into double
    cvtsi2sd xmm13, r14                         ;Converting initial tics double
    subsd xmm15, xmm13                          ;Tics After - Tics Before

    ;Getting computer speed in GHz
    mov rax, 1
    call getfreq
    movsd xmm13, xmm0                           ;GHz frequency

    ;Converting elapsed time into seconds
    mov r15, 0x41cdcd6500000000                 ;1 billion
    movq xmm12, r15

    ;Performing arithmetic
    mulsd xmm12, xmm13                          ;1 billion * GHz
    movsd xmm11, xmm15                          ;Making copy of elapsed time
    divsd xmm15, xmm12                          ;Seconds = Elapsed time/(1 billion * GHz) 

    ;Printing out elapsed time in tics and seconds
    push qword 100
    mov rax, 1
    mov rdi, elapsedTime 
    movsd xmm0, xmm11                           ;Elapsed time in tics
    movsd xmm1, xmm15                           ;Elapsed time in seconds
    call printf
    pop rax
    
    ;---------------------------------------------------------------------------------;
    ; NOTE: When entering in 1 trillion it took 4050.7991070782140923 seconds to run  ;
    ;       and the harmonic sum was 28.2082376785053                                 ;
    ;---------------------------------------------------------------------------------;

    ;==============================================ENDING STATEMENT=================================================
endProgram:
    
    ;Ending statement to cap off manager.asm
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, returnToDriver
    call printf

    movsd xmm0, xmm14                           ;Returning sum to main

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

    ret                                         ;Returning calculated sum to main

    ;==============================================END OF MODULE=================================================

