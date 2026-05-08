# ENUNCIADO: Sumar los elementos de un arreglo de enteros en ensamblador.
# SOLUCIÓN: Suma los elementos 2, 4, 6, 8 y devuelve 20.
.intel_syntax noprefix
.global main
.section .data
numbers: .long 2, 4, 6, 8
.section .text
main:
    lea rsi, numbers
    mov ecx, 4
    xor rax, rax
    xor rbx, rbx
.loop:
    mov edx, dword ptr [rsi + rbx*4]
    add rax, rdx
    inc rbx
    cmp rbx, rcx
    jne .loop
    mov rdi, rax
    mov rax, 60
    syscall
