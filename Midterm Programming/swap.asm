;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Reverse an Array
;Programming Language: x86 Assembly
;
;General Purpose: This program asks the user to input some integers into an array. It then displays 
;				  all numbers in the array but sorted. It then displays that same array in inverse.
;
;File Description: swap.asm takes in 2 integers and swaps their memory addresses. This is a reference from 
;				   assignment 3.
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

extern printf
extern scanf
global swap


section .data
	;Nothing defined in section .data

section .bss
	;Nothing defined in section .bss

section .text
swap:

	push rbp                                                    ;Backup rbp
	mov  rbp,rsp                                                ;The base pointer now points to top of stack
	push rdi                                                    ;Backup rdi
	push rsi                                                    ;Backup rsi
	push rdx                                                    ;Backup rdx
	push rcx                                                    ;Backup rcx
	push r8                                                     ;Backup r8
	push r9                                                     ;Backup r9
	push r10                                                    ;Backup r10
	push r11                                                    ;Backup r11
	push r12                                                    ;Backup r12
	push r13                                                    ;Backup r13
	push r14                                                    ;Backup r14
	push r15                                                    ;Backup r15
	push rbx                                                    ;Backup rbx
	pushf                                                       ;Backup rflags
    push rax

  
    ;===================Doing the swap==================================
    mov r14, rdi        ;My array
    mov r12, rsi        ;First element to swap 
    mov r15, rdx        ;Second element to swap 

    mov r8, [r14 + r12 * 8]
    mov r9, [r14 + r15 *8]

    mov [r14 + r12 * 8], r9
    mov [r14 + r15 *8], r8
    ;====================================================================

endSwap:

    pop rax
	popf                                                        ;Restore rflags
	pop rbx                                                     ;Restore rbx
	pop r15                                                     ;Restore r15
	pop r14                                                     ;Restore r14
	pop r13                                                     ;Restore r13
	pop r12                                                     ;Restore r12
	pop r11                                                     ;Restore r11
	pop r10                                                     ;Restore r10
	pop r9                                                      ;Restore r9
	pop r8                                                      ;Restore r8
	pop rcx                                                     ;Restore rcx
	pop rdx                                                     ;Restore rdx
	pop rsi                                                     ;Restore rsi
	pop rdi                                                     ;Restore rdi
	pop rbp                                                     ;Restore rbp


	ret                           
	;==========================================================END OF MODULE============================================================
                    	    
