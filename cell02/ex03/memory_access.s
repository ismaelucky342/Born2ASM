# ENUNCIADO: Acceder a memoria en ensamblador, leer y escribir elementos de un array.
# SOLUCIÓN: Lee el tercer elemento de un arreglo, le suma 10 y lo escribe de nuevo.
.intel_syntax noprefix
.global main
.section .data
array: .long 1, 2, 3, 4, 5
.section .text
main:
    lea rbx, array
    mov eax, dword ptr [rbx + 8]  # tercer elemento = 3
    add eax, 10                   # eax = 13
    mov dword ptr [rbx + 8], eax
    mov rdi, rax
    mov rax, 60
    syscall
