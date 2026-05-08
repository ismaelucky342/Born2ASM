# ENUNCIADO: Implementar un bucle de comandos simple en ensamblador que cicla varias veces y usa un dispatch básico.
# SOLUCIÓN: Emula un bucle de shell que repite tres iteraciones y devuelve 0.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rcx, 3
.loop:
    dec rcx
    cmp rcx, 0
    je .done
    jmp .loop
.done:
    xor rdi, rdi
    mov rax, 60
    syscall
