extern printf
extern scanf
extern getfreq

global convert

segment .data

frequency db "getfreq: %lf",10,0
results db "cycles: %ld seconds: %lf",10,0

segment .bss

segment .text
convert:
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

; btw these are just sample tics/cycles from my assignment.
mov r15, 104226862307959    ; Final time (cycles)
mov r14, 91214605424029     ; Initial time (cycles)

sub r15, r14                ; Elapsed time (cycles)
cvtsi2sd xmm13, r15

mov rax, 0
call getfreq
movsd xmm15, xmm0

mov rax, 1
mov rdi, frequency
movsd xmm0, xmm15
call printf

;Converting elapsed time into seconds
mov r13, 0x41cdcd6500000000                 ; 1 billion
movq xmm12, r13

;Performing arithmetic
movsd xmm14, xmm15
mulsd xmm14, xmm12                          ; GHz * 1 billion
divsd xmm13, xmm14                          ; Elapsed time / (GHz * 1 billion)

mov rax, 1
mov rdi, results
mov rsi, r15
movsd xmm0, xmm13
call printf

movsd xmm0, xmm13       ; Return the seconds to main.

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
