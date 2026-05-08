# ENUNCIADO: Construir una pequeña máquina virtual que interprete un bytecode simple.
# SOLUCIÓN: Implementa una VM que suma dos constantes y devuelve el resultado 5.
.intel_syntax noprefix
.global main
.section .data
code: .byte 1, 2, 3, 0   # 1 = PUSH1, 2 = PUSH2, 3 = ADD, 0 = HALT
.section .text
main:
    lea rsi, code
    xor rbp, rbp
    xor rax, rax
.loop:
    movzx rcx, byte ptr [rsi + rbp]
    cmp cl, 0
    je .halt
    cmp cl, 1
    je .push1
    cmp cl, 2
    je .push2
    cmp cl, 3
    je .add
    jmp .halt
.push1:
    mov rdx, 2
    push rdx
    inc rbp
    jmp .loop
.push2:
    mov rdx, 3
    push rdx
    inc rbp
    jmp .loop
.add:
    pop rdx
    pop rsi
    add rsi, rdx
    push rsi
    inc rbp
    jmp .loop
.halt:
    pop rax
    mov rdi, rax
    mov rax, 60
    syscall
