# ENUNCIADO: Simular un núcleo de juego simple que actualiza posición y comprueba límites.
# SOLUCIÓN: Suma velocidad a la posición, aplica un límite máximo y devuelve la posición final 10.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 8
    mov rbx, 2
    add rax, rbx
    cmp rax, 10
    jle .done
    mov rax, 10
.done:
    mov rdi, rax
    mov rax, 60
    syscall
