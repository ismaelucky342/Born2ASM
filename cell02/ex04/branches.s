# ENUNCIADO: Usar comparaciones y saltos condicionales para seleccionar el mayor de dos valores.
# SOLUCIÓN: Compara 15 y 20, toma el mayor y devuelve 20.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 15
    mov rbx, 20
    cmp rax, rbx
    jge .keep_rax
    mov rax, rbx
.keep_rax:
    mov rdi, rax
    mov rax, 60
    syscall
