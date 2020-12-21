;=====================================================================================================================================
;Program Name: Array Sort
;Programming Language: x86 Assembly
;File Description: read_clock.asm reads how many tics he CPU made before the program starts then after the program ends.
;				   This is used to measure how long it took to run the sorting algorithms. This is a reference from assignemnt 3.
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

;==========================================================START OF MODULE============================================================

extern printf
extern scanf
extern input_array
global read_clock


section .data
	;Nothing defined in section .data

section .bss
	;Nothing defined in section .bss

	
section .text
read_clock:

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

	cpuid			;Identify your CPU	

	;********************************************************************;
	rdtsc			;Gets number of tics. This combines one half of 	 ;
	;				;rdx and one half of rax into 1 register.			 ;   
	;				;rdtsc = "Read Time Stamp Counter"					 ;
	;																	 ;
	;																	 ;
	;********************************************************************;

	shl rdx, 32		;Shifts the 32 bits of rdx to the the.
	add rax, rdx		
	
end_clock:
    ;pop rax                                                     ;Remove the extra -1 from the stack
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
