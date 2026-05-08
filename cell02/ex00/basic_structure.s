# ENUNCIADO: Crear un programa básico en ensamblador moderno (.s) con sección de datos y texto.
# El programa debe definir datos estáticos, usar registros y devolver un resultado como código de salida.
# SOLUCIÓN: El programa suma 5 + 7 y devuelve 12.
.intel_syntax noprefix
.global main
.section .data
message: .asciz "Cell02 ex00: basic structure"
.section .text
main:
    mov rax, 5
    add rax, 7          # rax = 12
    mov rdi, rax        # exit code = 12
    mov rax, 60
    syscall
