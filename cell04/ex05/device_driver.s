# ENUNCIADO: Simular un controlador de dispositivo con registros en memoria.
# SOLUCIÓN: Actualiza un registro de estado y devuelve el valor del registro "ready".
.intel_syntax noprefix
.global main
.section .data
device_status: .byte 0
.section .text
main:
    mov al, 1
    mov byte ptr [device_status], al
    movzx rax, byte ptr [device_status]
    mov rdi, rax
    mov rax, 60
    syscall
