# ENUNCIADO: Aplicar técnicas de optimización de instrucciones en ensamblador.
# SOLUCIÓN: Usa LEA para sumar valores de forma eficiente y devuelve 15.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 10
    lea rax, [rax + 4]
    add rax, 1
    mov rdi, rax
    mov rax, 60
    syscall
