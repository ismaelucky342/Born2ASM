# ENUNCIADO: Implementar un bucle simple en ensamblador que sume los números del 1 al 10.
# SOLUCIÓN: Usa un bucle con cmp/jne y devuelve 55.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rcx, 1
    xor rax, rax
.loop:
    add rax, rcx
    inc rcx
    cmp rcx, 11
    jne .loop
    mov rdi, rax
    mov rax, 60
    syscall
