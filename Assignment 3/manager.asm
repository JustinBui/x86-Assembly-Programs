;=====================================================================================================================================
;Program Name: Array Sort
;Programming Language: x86 Assembly
;File Description: manager.asm is called by the main driver file. This calls all other functions defined in input_array.asm,
;			  	   display_array.cpp, and bubble_sort.cpp.
;General Purpose: This program asks the user to input integers into an array to get it sorted in ascending order. Display 
;				  this array before sort and after. 


;Author: Justin Bui
;Email: Justin_Bui12@csu.fullerton.edu
;Institution: California State University, Fullerton
;Course: CPSC 240-05
;Start Date: 25 October, 2020

;Copyright (C) 2020 Justin Bui
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
;version 3 as published by the Free Software Foundation.
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
;Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.
;======================================================================================================================================


extern printf
extern input_array		
extern display_array		
extern bubble_sort
global manageSortFunctions


section .data
    stringOutputFormat db "%s", 0
	introduce db "This program will sum your array of integers.", 10, 0
	enterIntegers db "Enter a sequence of long integers separated by white space.", 10, 0
	controlD db "After the last input press enter followed by Control+D: ", 10, 0
	numbersReceived db "These numbers were received and placed into the array: ", 10, 0
	arraySorted db "The array has been sorted by the bubble sort algorithm", 10, 0
	introduceOrder db "This is the order of the values in the array now: ", 10, 0
	outro db "The largest number in the array will now be returned to the main function", 10, 0

section .bss
	myArray: resq 100

section .text
manageSortFunctions:
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
    mov rax, 0
    mov rdi, stringOutputFormat
    mov rsi, introduce
    call printf

    mov rax, 0
    mov rdi, stringOutputFormat
    mov rsi, enterIntegers
    call printf

    mov rax, 0
    mov rdi, stringOutputFormat
    mov rsi, controlD
    call printf

	;manager.asm now calls input_array.asm
	mov rax, 0
	mov rdi, myArray			;Passes myArray into rdi
	mov rsi, 100				;Passes max amt of qwords of myArray
	call input_array			;Calling input_array
	push qword 0
	mov r12, rax				;Passing current size of array into r12

	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, numbersReceived
	call printf

	;manager.asm now calls display_array.cpp
	mov rax, 0
	mov rdi, myArray			;Passing in myArray as 1st parameter to the c++ function
	mov rsi, r12				;Passing current size of array as 2nd parameter
	call display_array			;Calling printArray from display_array.cpp

	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, arraySorted
	call printf
	
	;Bubble sorting myArray
	mov rax, 0
	mov rdi, myArray
	mov rsi, r12
	call bubble_sort

	;Printing out the sorted array
	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, introduceOrder
	call printf

	mov rax, 0
	mov rdi, myArray
	mov rsi, r12
	call display_array

	;Stating the outro before ending the program 
	mov rax, 0
	mov rdi, stringOutputFormat
	mov rsi, outro
	call printf

	;Moving the largest value into rax to return
	dec r12
	mov rax, [myArray + r12 * 8]

endManager:

	add rsp, 8													;Equivalent to pop
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




