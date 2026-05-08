# ENUNCIADO: Practicar operaciones de registro y movimiento de datos.
# Cargar valores en registros, mover datos entre ellos y combinar resultados.
# SOLUCIÓN: Carga 5 en RAX y 12 en RBX, suma RBX a RAX y devuelve 17.
.intel_syntax noprefix
.global main
.section .text
main:
    mov rax, 5
    mov rbx, 12
    add rax, rbx        # rax = 17
    mov rdi, rax
    mov rax, 60
    syscall
