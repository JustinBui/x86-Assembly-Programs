;NAME: Justin Bui
;CPSC 240-05 MIDTERM

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
    