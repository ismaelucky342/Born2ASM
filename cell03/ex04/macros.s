# ENUNCIADO: Crear y usar macros en ensamblador para evitar repetición de código.
# SOLUCIÓN: Define un macro ADD_CONST y úsalo para sumar valores a RAX.
.intel_syntax noprefix
.global main
.macro ADD_CONST reg, val
    add \reg, \val
.endm
.section .text
main:
    mov rax, 5
    ADD_CONST rax, 3
    ADD_CONST rax, 4
    mov rdi, rax
    mov rax, 60
    syscall
