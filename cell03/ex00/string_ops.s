# ENUNCIADO: Calcular la longitud de una cadena terminada en cero usando ensamblador.
# SOLUCIÓN: Recorre el string byte a byte y devuelve la longitud 14.
.intel_syntax noprefix
.global main
.section .data
message: .asciz "Hello, ASM world"
.section .text
main:
    lea rsi, message
    xor rcx, rcx
.loop:
    cmp byte ptr [rsi + rcx], 0
    je .done
    inc rcx
    jmp .loop
.done:
    mov rdi, rcx
    mov rax, 60
    syscall
