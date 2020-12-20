;=====================================================================================================================================
;Program Name: Arrays
;Programming Language: x86 Assembly
;File Description: This takes in the array defined in manager.asm, and current number of items in the array to mock a 
;for loop by traversing through each element to calculate and return the sum of all integers.


;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
;Start Date: 18 September, 2020

;Copyright (C) 2020 Justin Bui
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
;version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
;======================================================================================================================================


global doAddition

section .data
	;Nothing defined in .data

section .bss
	;Nothing defined in .bss

section .text
doAddition:

	;Back up the general purpose registers for the sole purpose of protecting the data of the caller.
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


	mov r11, rsi			;Moving current amount in array into r11
					;Serves as counter value for the "for loop"
	mov r14, rdi			;Moving myArray stored in rdi into r14
	mov r15, 0			;Serves as current index
	mov r13, 0			;Serves as total

mockForLoop:

	cmp r15, r11
	jg terminateLoop

	;r13 = r13 + myArray[r15]
	add r13, [r14 + r15 * 8]

	inc r15
	jmp mockForLoop

terminateLoop:

	mov rax, r13

	;Restore the original values to the general registers before returning to the caller.
	popf
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

	ret                                               ;Pop the integer stack and jump to the address represented by the popped value.

