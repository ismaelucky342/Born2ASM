# ENUNCIADO: Practicar manipulación de pila con push y pop en ensamblador.
# SOLUCIÓN: Empuja 3 y 7, los recupera y devuelve su suma 10.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 3
    push rax
    mov rax, 7
    push rax
    pop rbx
    pop rax
    add rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall
