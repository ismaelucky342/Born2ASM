# ENUNCIADO: Simular una etapa simple de backend de compilador que traduce operaciones aritméticas a ensamblador.
# SOLUCIÓN: Traduce la operación pseudo "result = a * 2 + b" y devuelve 22.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 10
    lea rax, [rax + rax]
    add rax, 2
    mov rdi, rax
    mov rax, 60
    syscall
