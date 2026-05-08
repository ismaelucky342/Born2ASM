# ENUNCIADO: Usar operaciones bit a bit para manipular valores.
# SOLUCIÓN: Rota el byte 0x12 a la izquierda 4 posiciones y devuelve 33.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 0x12
    rol rax, 4
    and rax, 0xFF
    mov rdi, rax
    mov rax, 60
    syscall
