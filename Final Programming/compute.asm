;=======================================================================================;
;                                   NAME: Justin Bu                                     ;
;                                   DATE: 12/14/20                                      ;
;                                   CWID:887956068                                      ;
;=======================================================================================;
extern scanf
extern printf
extern atof
extern isfloat

global compute

section .data
    stringFormat db "%s", 0
    floatFormat db "%lf", 0
    pleaseEnter db "Please enter hours worked: ", 0
    pleaseEnter2 db "Please enter pay rate: ", 0
    error db "Error try again: ", 0
    finalStatement db "The total pay is $ %0.2lf", 10, 0
    shutDown db "Shut down. You may run this program again", 10, 0


section .bss

section .text
compute:

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

input:
    ;=============================================HOURS=============================================

    ;Telling user to input hours worked
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, pleaseEnter
    call printf

    mov r12, 0          ;Iterator for it to go to 2
    mov r13, 1          ;Limit for input
tryAgain1:

    ;Inputting hours worked
    push qword 100
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, rsp
    call scanf

    ;Checking if is valid input
    xor rax, rax
    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid1

    mov rax, 1
    mov rdi, rsp
    call atof
    movsd xmm15, xmm0   ;Hours worked will be stored in xmm15

    pop r15             ;Pop to make up for scanf
    

    ;=============================================PAY RATE=============================================
    mov r12, 0                      ;Reset iterator


    ;Telling user to input hours worked
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, pleaseEnter2
    call printf

tryAgain2:

    ;Inputting pay rate
    push qword 100
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, rsp
    call scanf

    ;Checking if is valid input
    xor rax, rax
    mov rdi, rsp
    call isfloat
    cmp rax, 0
    je invalid2

    cmp r11, 0
    je invalid2

    ;Converting to float for pay rate
    mov rax, 1
    mov rdi, rsp
    call atof
    movsd xmm14, xmm0               ;Pay rate is stored in xmm14

    pop r15
    jmp arithmetic
    ;=============================================INVALID INPUTS=============================================

invalid1:
    pop rax                 ;Making up for scanf

    cmp r12, r13
    je shut

    ;Telling user it is an error
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, error
    call printf

    inc r12
    jmp tryAgain1

invalid2:
    pop rax                 ;Making up for scanf

    cmp r12, r13
    je shut

    ;Telling user it is an error
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, error
    call printf

    inc r12
    jmp tryAgain2

    ;=========================================CALCULATE==========================================

arithmetic:
    ;xmm15 is the hours worked
    ;xmm14 is the pay rate
    mov r15, 0x4044000000000000     ;40.0
    movq xmm13, r15

    ucomisd xmm15, xmm13            ;Comparing if it is over time
    ja overtime
    jmp nonOvertime

overtime:
   

    movsd xmm11, xmm15          ; copy hours to xmm11
    subsd xmm11, xmm13          ; sub 40 from hours
    mulsd xmm11, xmm14          ; multiply by pay rate

    mov r15, 0x3FE0000000000000     ;0.5
    movq xmm12, r15

    mulsd xmm11, xmm12          ; multiply overtime hours by 0.5 

    mulsd xmm15, xmm14          ; multiply hours by pay rate

    addsd xmm15, xmm11          ; add overtime pay to gross 

    jmp end

nonOvertime:
    mulsd xmm15, xmm14
    jmp end 

shut:
    ;Statement telling user shut down error
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, shutDown
    call printf

    ;Returning 0 to the driver if the program shut down
    mov r11, 0x0000000000000000
    movq xmm15, r11
    jmp return

end:
    push qword 100
    mov rax, 1
    mov rdi, finalStatement
    movsd xmm0, xmm15
    call printf
    pop rax

return:

    movsd xmm0, xmm15       ;Returning

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
    