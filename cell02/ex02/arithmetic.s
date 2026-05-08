# ENUNCIADO: Implementar operaciones aritméticas básicas en ensamblador: suma, resta, multiplicación y división.
# SOLUCIÓN: Realiza (10+4-3) y una división de 42 entre 7, devolviendo el resultado de la división.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 10
    add rax, 4          # rax = 14
    sub rax, 3          # rax = 11
    mov rbx, 42
    mov rcx, 7
    cqo
    idiv rcx            # rax = 6, rdx = 0
    mov rdi, rax
    mov rax, 60
    syscall
