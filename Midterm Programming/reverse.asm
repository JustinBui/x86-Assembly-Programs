;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Reverse an Array
;Programming Language: x86 Assembly
;
;General Purpose: This program asks the user to input some integers into an array. It then displays 
;				  all numbers in the array but sorted. It then displays that same array in inverse.
;
;File Description: reverse.asm reverses any arrays passed into this file. It does this by swapping 
;                  2 elements on each ends of the array, the makes it's way to swap elements towards the 
;                  middle until the center is reached. 
;
;Start Date: 26 November, 2020
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
extern swap 
global reverse

section .data
    ;Nothing defined in .data

section .bss
    ;Nothing defined in .bss

section .text
reverse:

    ;16 Pushes
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

    mov r12, 0          ;First term to swap 
    mov r13, rsi        ;Second term to swap
    dec r13
    mov r14, rdi        ;numArray

begin_loop:

    ;========================Swap function==============================
    xor rax, rax
    mov rdi, r14        ;myArray
    mov rsi, r12        ;First term to swap
    mov rdx, r13        ;Second term to swap 
    call swap
    ;===================================================================

    inc r12             ;Incrementing first value to swap 
    dec r13             ;Decrementing second value to swap 
                        ;Both iterators move towards the center of loop

    cmp r12, r13
    jge end_loop        ;End loop if both incrementors have reached center (For odd num elements)
                        ;Or if incrementors met each other towards the center (For even number of elements)


    jmp begin_loop

end_loop:
    ;16 pops
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
    ;==========================================================END OF MODULE============================================================
