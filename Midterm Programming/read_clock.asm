;NAME: Justin Bui
;CPSC 240-05 MIDTERM

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
