# ENUNCIADO: Emular operaciones de E/S sobre buffers en memoria.
# SOLUCIÓN: Copia cinco bytes de src a dst y devuelve el último byte copiado.
.intel_syntax noprefix
.global main
.section .data
src: .asciz "HELLO"
dst: .space 5
.section .text
main:
    lea rsi, src
    lea rdi, dst
    mov rcx, 5
.copy_loop:
    mov al, byte ptr [rsi]
    mov byte ptr [rdi], al
    inc rsi
    inc rdi
    dec rcx
    jne .copy_loop
    mov rdi, 79         # ASCII 'O' = 79
    mov rax, 60
    syscall
