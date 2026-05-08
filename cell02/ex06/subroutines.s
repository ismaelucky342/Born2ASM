# ENUNCIADO: Crear y llamar a subrutinas en ensamblador. Implementar una función de multiplicación.
# SOLUCIÓN: Llama a una subrutina que multiplica 7 * 8 y devuelve 56.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rdi, 7
    mov rsi, 8
    call multiply
    mov rdi, rax
    mov rax, 60
    syscall
multiply:
    mov rax, rdi
    imul rax, rsi
    ret
