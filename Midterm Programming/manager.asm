;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Reverse an Array
;Programming Language: x86 Assembly
;
;General Purpose: This program asks the user to input some integers into an array. It then displays 
;				  all numbers in the array but sorted. It then displays that same array in inverse.
;
;File Description: manager.asm does most of the work. It calls the various files needed to get this program runnig
;                  (See the externs at the start of the module). 
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
extern input_array
extern display_array
extern reverse
global manager

section .data
	stringOutputFormat db "%s", 0
	controlD db "Please enter integers separated by ws. Press enter and cntl+d to finished", 10, 0
    numbersReceived db "The values in the array are: ", 0
    reversed_array db "The data have been reversed.", 10
                    db "The values in the array are: ", 10, 0
    negative_one db "Negative one will be returned to the driver", 10, 0

section .bss
    myArray: resq 100

section .text
manager:

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

    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, controlD 
    call printf

    ;==============Taking in user input=========================================
    push qword 1
    xor rax, rax
    mov rdi, myArray
    mov rsi, 100
    call input_array
    mov r12, rax            ;Current size of array
    pop r8
    ;===========================================================================
    
    ;===================Displaying the array==========================================
    xor rax, rax
    mov rdi, stringOutputFormat
    mov rdi, numbersReceived
    call printf
    
    xor rax, rax
    mov rdi, myArray			
	mov rsi, r12				
	call display_array			
    ;===========================================================================

    ;===================Doing the Reverse of array==========================================
    xor rax, rax
    mov rdi, myArray
    mov rsi, r12
    call reverse

    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, reversed_array
    call printf

    ;Displaying the reversed array 
    xor rax, rax
    mov rdi, myArray
    mov rsi, r12
    call display_array
    ;===========================================================================

end:

    xor rax, rax
    mov rdi, stringOutputFormat
    mov rsi, negative_one
    call printf
    
    mov rax, -1     ;Manager is to return -1

    ;16 pops
    add rsp, 8      ;Equivalent to a pop
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
