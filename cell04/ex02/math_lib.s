# ENUNCIADO: Implementar un pequeño conjunto de funciones matemáticas reutilizables en ensamblador.
# SOLUCIÓN: Usa las subrutinas add, sub, mul y div para calcular (8+12) y devolver 20.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rdi, 8
    mov rsi, 12
    call add
    mov rdi, rax
    mov rsi, 0
    call add
    mov rdi, rax
    mov rax, 60
    syscall
add:
    mov rax, rdi
    add rax, rsi
    ret
sub:
    mov rax, rdi
    sub rax, rsi
    ret
mul:
    mov rax, rdi
    imul rax, rsi
    ret
div:
    mov rax, rdi
    cqo
    idiv rsi
    ret
