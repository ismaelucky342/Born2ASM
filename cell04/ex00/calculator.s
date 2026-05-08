# ENUNCIADO: Construir un programa de cálculos simples usando subrutinas reutilizables.
# SOLUCIÓN: Suma 5+7 y multiplica el resultado por 2. Devuelve 24.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rdi, 5
    mov rsi, 7
    call add
    mov rdi, rax
    mov rsi, 2
    call mul
    mov rdi, rax
    mov rax, 60
    syscall
add:
    mov rax, rdi
    add rax, rsi
    ret
mul:
    mov rax, rdi
    imul rax, rsi
    ret
