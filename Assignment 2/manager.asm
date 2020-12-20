;=====================================================================================================================================
;Program Name: Arrays
;Programming Language: x86 Assembly
;File Description: manager.asm is called by the main driver file. This calls all other functions defined in input_array.asm, sum.asm,
;display_array.cpp, atol.asm, and isinteger.cpp.


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


extern printf
extern takeInput		;From input_array.asm
extern printArray		;From display_array.cpp
extern doAddition		;From sum.asm
global determineSum


section .data
	introduce db "This program will sum your array of integers.", 10, 0
	enterIntegers db "Enter a sequence of long integers separated by white space.", 10, 0
	controlD db "After the last input press enter followed by Control+D: ", 10, 0
	numbersReceived db "These numbers were received and placed into the array: ", 10, 0
	intOutputFormat1 db "The sum of the %ld numbers in this array is ", 0
	intOutputFormat2 db "%ld", 10, 0
	outro db "The sum will now be returned to the main function", 10, 0
	stringOutputFormat db "%s", 0


section .bss
	myArray: resq 100

section .text

determineSum:
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

promptUser:

	;Introducing what this program will do
	mov rdi, stringOutputFormat
	mov rsi, introduce
	mov rax, 0
	call printf

	;Instructing user to enter a sequence of long integers separated by white space
	mov rdi, stringOutputFormat
	mov rsi, enterIntegers
	mov rax, 0
	call printf

	;Instructing user to press ctrl+D when completed
	mov rdi, stringOutputFormat
	mov rsi, controlD
	mov rax, 0
	call printf

	;manager.asm now calls input_array.asm
	mov rax, 0
	mov rdi, myArray			;Passes myArray into rdi
	mov rsi, 100				;Passes max amt of qwords of myArray
	call takeInput				;Calling takeInput from array_input.asm
	mov r12, rax				;Passing current size of array into r12

	;manager.asm now calls sum.asm
	mov rax, 0
	mov rdi, myArray			;Passing in myArray (Like above block)
	mov rsi, r12				;Passing in current size of array
	call doAddition				;Calling doAddition from sum.asm
	mov r13, rax				;Returning calculated sum

printResults:

	;Printing out what the user inputed
	mov rdi, stringOutputFormat
	mov rsi, numbersReceived
	mov qword rax, 0
	call printf

	;manager.asm now calls display_array.cpp
	mov qword rax, 0
	mov rdi, myArray			;Passing in myArray as 1st parameter to the c++ function
	mov rsi, r12				;Passing current size of array as 2nd parameter
	call printArray				;Calling printArray from display_array.cpp

	;Prints number of elements in array and sum
	mov rax, 0
	mov rdi, intOutputFormat1
	mov rsi, r12
	call printf

	mov rax, 0
	mov rdi, intOutputFormat2
	mov rsi, r13
	call printf

endManager:

	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, outro
	call printf

	push r13

	pop rax                                                     ;Remove the extra -1 from the stack
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


	ret                                               	    ;ret returns r13 (Sum of all integers)




