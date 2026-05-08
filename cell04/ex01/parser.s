# ENUNCIADO: Parsear una cadena simple de texto con una operación aritmética y calcular su resultado.
# SOLUCIÓN: Lee "123+45", convierte los operandos a enteros y devuelve 168.
.intel_syntax noprefix
.global main
.section .data
expr: .asciz "123+45"
.section .text
main:
    lea rsi, expr
    xor rax, rax
    xor rbx, rbx
    xor rcx, rcx
.parse_first:
    mov dl, byte ptr [rsi + rcx]
    cmp dl, '+'
    je .first_done
    sub dl, '0'
    imul rax, rax, 10
    add rax, rdx
    inc rcx
    jmp .parse_first
.first_done:
    inc rcx
.parse_second:
    mov dl, byte ptr [rsi + rcx]
    cmp dl, 0
    je .done
    sub dl, '0'
    imul rbx, rbx, 10
    add rbx, rdx
    inc rcx
    jmp .parse_second
.done:
    add rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall
