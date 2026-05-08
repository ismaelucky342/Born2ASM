# ENUNCIADO: Implementar una operación de acelerador de señal simple (producto punto) en ensamblador.
# SOLUCIÓN: Calcula el producto punto de vectores [1,2,3] y [4,5,6] y devuelve 32.
.intel_syntax noprefix
.global main
.section .data
x: .long 1, 2, 3
y: .long 4, 5, 6
.section .text
main:
    lea rsi, x
    lea rdi, y
    xor rax, rax
    mov rcx, 3
    xor rbx, rbx
.dot_loop:
    mov edx, dword ptr [rsi + rbx*4]
    mov eax, dword ptr [rdi + rbx*4]
    imul eax, edx
    add rax, rdx
    inc rbx
    cmp rbx, rcx
    jne .dot_loop
    mov rdi, rax
    mov rax, 60
    syscall
