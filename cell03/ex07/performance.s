# ENUNCIADO: Usar instrucciones de selección condicional para evitar ramas costosas.
# SOLUCIÓN: Calcula el máximo entre 5 y 12 con CMOV y devuelve 12.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 5
    mov rbx, 12
    cmp rax, rbx
    cmovl rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall
