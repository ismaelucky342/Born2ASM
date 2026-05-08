# ENUNCIADO: Representar una estructura simple en memoria y actualizar uno de sus campos.
# SOLUCIÓN: Define una estructura con edad, puntaje y flags, aumenta el puntaje en 10 y devuelve el puntaje final.
.intel_syntax noprefix
.global main
.section .data
person_age: .quad 25
person_score: .quad 32
person_flags: .quad 1
.section .text
main:
    lea rbx, person_score
    mov rax, qword ptr [rbx]
    add rax, 10
    mov qword ptr [rbx], rax
    mov rdi, rax
    mov rax, 60
    syscall
