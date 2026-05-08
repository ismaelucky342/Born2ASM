# ENUNCIADO: Usar una tabla de constantes para seleccionar un valor por índice.
# SOLUCIÓN: Lee el elemento en índice 2 de una tabla y devuelve 30.
.intel_syntax noprefix
.global main
.section .data
table: .long 10, 20, 30, 40
.section .text
main:
    mov edi, 2
    lea rsi, table
    mov eax, dword ptr [rsi + rdi*4]
    mov rdi, rax
    mov rax, 60
    syscall
