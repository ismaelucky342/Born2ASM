# ENUNCIADO: Implementar cifrado XOR simple sobre un buffer en memoria.
# SOLUCIÓN: Aplica XOR con la clave 0xAA a cinco bytes de texto y devuelve el primer byte cifrado.
.intel_syntax noprefix
.global main
.section .data
plaintext: .byte 0x48, 0x45, 0x4C, 0x4C, 0x4F
key: .byte 0xAA
.section .text
main:
    lea rsi, plaintext
    movzx rbx, byte ptr [key]
    mov rcx, 5
.encrypt:
    mov al, byte ptr [rsi]
    xor al, bl
    mov byte ptr [rsi], al
    inc rsi
    dec rcx
    jne .encrypt
    movzx rdi, byte ptr [plaintext]
    mov rax, 60
    syscall
