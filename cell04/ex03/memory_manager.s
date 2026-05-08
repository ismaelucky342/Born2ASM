# ENUNCIADO: Simular un gestor de memoria básico que asigna bloques dentro de un pool estático.
# SOLUCIÓN: Reserva un pool en BSS, escribe valores en el primer bloque y devuelve la suma de los bytes almacenados.
.intel_syntax noprefix
.global main
.section .bss
pool: .skip 64
.section .text
main:
    lea rdi, pool
    mov byte ptr [rdi], 10
    mov byte ptr [rdi + 1], 20
    mov byte ptr [rdi + 2], 30
    movzx rax, byte ptr [rdi]
    movzx rcx, byte ptr [rdi + 1]
    add rax, rcx
    movzx rcx, byte ptr [rdi + 2]
    add rax, rcx
    mov rdi, rax
    mov rax, 60
    syscall
