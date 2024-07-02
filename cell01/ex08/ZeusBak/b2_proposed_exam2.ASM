; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "NewFile"                   ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+


; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application

AppEntry                ld hl, num1                     ; Cargar dirección de num1 en HL
                        ld de, num2                     ; Cargar dirección de num2 en DE
                        ld bc, 7                        ; Cargar el número de elementos (7) en BC
                        ld ix, resultado                ; Cargar dirección de resultado en IX

bucle_comparacion       ld a, (hl)                      ; Cargar el valor de num1 en A
                        sub (de)                        ; Restar el valor de num2 a A
                        jp m, almacenar_cero            ; Si la resta es negativa, ir a almacenar_cero
                        ld a, 1                         ; Si la resta es positiva o cero, cargar 1 en A
                        jr almacenar_resultado          ; Ir a almacenar_resultado

almacenar_cero          ld a, 0                         ; Cargar 0 en A

almacenar_resultado     ld (ix), a                      ; Almacenar el resultado (0 o 1) en resultado
                        inc hl                          ; Incrementar HL para el siguiente elemento de num1
                        inc de                          ; Incrementar DE para el siguiente elemento de num2
                        inc ix                          ; Incrementar IX para la siguiente posición en resultado
                        dec bc                          ; Decrementar BC (contador de elementos)
                        ld a, b                         ; Cargar el valor de B en A
                        or c                            ; Realizar OR con el valor de C (comprobar si BC es 0)
                        jr nz, bucle_comparacion        ; Si BC no es 0, repetir el bucle

fin                     halt                            ; Detiene la CPU
                        jp Inicio                       ; Bucle infinito para detener la ejecución

; Datos
num1                    defb 7, 4, 2, 10, 4, 1, 3       ; Conjunto de números num1
num2                    defb 5, 6, 9, 9, 1, 0, 4        ; Conjunto de números num2
resultado               defs 7                          ; Reserva 7 bytes para el resultado


; Stop planting code after this. (When generating a tape file we save bytes below here)
AppLast                 equ *-1                         ; The last used byte's address

; Generate some useful debugging commands

                        profile AppFirst,AppLast-AppFirst+1 ; Enable profiling for all the code

; Setup the emulation registers, so Zeus can emulate this code correctly

Zeus_PC                 equ AppEntry                    ; Tell the emulator where to start
Zeus_SP                 equ $FF40                       ; Tell the emulator where to put the stack

; These generate some output files

                        ; Generate a SZX file
                        output_szx AppFilename+".szx",$0000,AppEntry ; The szx file

                        ; If we want a fancy loader we need to load a loading screen
;                        import_bin AppFilename+".scr",$4000            ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                        output_tzx AppFilename+".tzx",AppFilename,"",AppFirst,AppLast-AppFirst,1,AppEntry ; A tzx file using the loader


