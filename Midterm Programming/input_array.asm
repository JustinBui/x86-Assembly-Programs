;====================================================PROGRAM INFORMATION==============================================================
;Program Name: Reverse an Array
;Programming Language: x86 Assembly
;
;General Purpose: This program asks the user to input some integers into an array. It then displays 
;				  all numbers in the array but sorted. It then displays that same array in inverse.
;
;File Description: input_array.asm asks the user to input as many integers as they can until ctrl+d
;				   is pressed. Anything that is not a valid integer will not be put into the array
;				   from the input validations it makes for each number.
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
extern isinteger			;From isinteger.asm
extern atolong				;From atol.asm
global input_array

section .data
	integerOutputFormat db "%ld", 10, 0
	stringOutputFormat db "%s", 0
	controlDPressed db "Control D is pressed.", 10, 0
	overloadStatement db "You have reached the maximum elements in the array.", 10, 0
	invalidType db "Invalid.", 10, 0

	debugger db "THIS IS THE DEBUGGER", 10, 0

section .bss
	;Nothing declared inside .bss

section .text
input_array:

	push rbp                                                    ;Backup rbp
	mov rbp, rsp                                                ;The base pointer now points to top of stack
	push rdi                                                    ;Backup rdi
	push rsi                                                    ;Backup rsi
	push rdx                                                    ;Backup rdx
	push rcx                                                    ;Backup rcx
	push r8							    ;Backup r8
	push r9                                                     ;Backup r9
	push r10                                                    ;Backup r10
	push r11                                                    ;Backup r11
	push r12                                                    ;Backup r12
	push r13                                                    ;Backup r13
	push r14                                                    ;Backup r14
	push r15                                                    ;Backup r15
	push rbx                                                    ;Backup rbx

	mov r14, rdi		;r14 has the pointer to the array in manager.asm
	mov r13, rsi		;r13 holds array capacity stored in rsi
	mov r12, 0		;r12 represents current index of array

startOfLoop:

	;Taking user inputs
	mov qword rax, 0
	mov rdi, stringOutputFormat
	push qword 0			;Pushing arbitrary quadword into the stack
	mov rsi, rsp
	call scanf

inputValidations:

	;Checks for ctrl+D
	cdqe				;Converts all rax from 32 --> 64 bits
	cmp rax, -1			;r15 is given -1 if user presses ctrl+D
	je ctrlD			;Exiting the loop if rax = -1 (When ctrl+D is pressed)

	;Checks if user input is an integer
	mov qword rax, 0
	mov rdi, rsp			;Passing user input (Stored in rsp) into isinteger
	call isinteger			;If user input is integer, return 1, else return 0
	cmp rax, 0			;Sees if user input is not int type
	je notAnInt

	;Converts any strings --> integer
	mov qword rax, 0
	mov rdi, rsp			;Passing user input stored in rsp into atolong
	call atolong
	mov r11, rax			;Storing processeed value into r11
	pop r8

	mov [r14 + r12 * 8], r11	;Stores user input (r11) into myArray (r14) from manager.asm
	inc r12				;Increments r12 to move to next address in myArray

	;Checks if array is full
	cmp r12, r13			;Compares if current index exceeds max index
	je overload			;Exit the program if current amount = capacity (i.e array is full)

	jmp startOfLoop			;If current amount < capacity, and Ctrl+D is not pressed, then restart loop

notAnInt:

	;Tells user of invalid input. Loops back to start of loop to try again.
	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, invalidType
	call printf
	pop r8
	jmp startOfLoop

overload:

	;Tells user they put too much elements in array
	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, overloadStatement
	push qword -999
	call printf
	jmp exitProgram

ctrlD:

	;Tells user that control + D is pressed
	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, controlDPressed
	call printf
	jmp exitProgram

exitProgram:


	mov qword rax, r12				;Backing up r12 into rax to be returned

	;Popping all of registers in reverse order as pushes
	pop rbx                                                     ;Restore rbx
	pop r15                                                     ;Restore r15
	pop r14                                                     ;Restore r14
	pop r13                                                     ;Restore r13
	pop r12                                                     ;Restore r12
	pop r11                                                     ;Restore r11
	pop r10                                                     ;Restore r10
	pop r9                                                      ;Restore r9
	pop r8							    						;Restore r8
	pop rcx                                                     ;Restore rcx
	pop rdx                                                     ;Restore rdx
	pop rsi                                                     ;Restore rsi
	pop rdi                                                     ;Restore rdi
	pop rbp                                                     ;Restore rbp
	pop rbx

	ret                                               
	;==========================================================END OF MODULE============================================================

