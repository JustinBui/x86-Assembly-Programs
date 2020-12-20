;NAME: Justin Bui
;CPSC 240-05 MIDTERM

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