; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "NewFile"                   ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+


; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application

AppEntry                LD HL, 8100H                    ; HL apunta a la direcci�n de memoria 8100H
                        LD DE, NUM1                     ; DE apunta al array NUM1
                        LD BC, 7                        ; BC contiene el n�mero de elementos en NUM1 y NUM2 (7 elementos)
                        CALL COPIAR_NUMEROS             ; Llama a la rutina que copia NUM1 a la memoria

                        LD DE, NUM2                     ; DE apunta al array NUM2
                        CALL COPIAR_NUMEROS             ; Llama a la rutina que copia NUM2 a la memoria

                        LD HL, 8100H                    ; HL apunta al inicio de los n�meros en memoria para NUM1
                        LD DE, 8107H                    ; DE apunta al inicio de los n�meros en memoria para NUM2 (7 posiciones m�s adelante)
                        LD IX, 8120H                    ; IX apunta al inicio de la memoria para almacenar los resultados

                        CALL CALCULAPOSNEG              ; Llama a la rutina para calcular la paridad de las sumas

                        HALT                            ; Detener la ejecuci�n

; Rutina para copiar n�meros a la memoria
COPIAR_NUMEROS:
                        LD A, (DE)                      ; Cargar A con el valor de la direcci�n apuntada por DE
                        LD (HL), A                      ; Guardar A en la direcci�n apuntada por HL
                        INC DE                          ; Incrementar DE para apuntar al siguiente n�mero
                        INC HL                          ; Incrementar HL para apuntar a la siguiente direcci�n en memoria
                        DEC BC                          ; Decrementar BC
                        LD A, B                         ; Comprobar si B es cero
                        OR C                            ; Comprobar si C es cero
                        JR NZ, COPIAR_NUMEROS           ; Si BC no es cero, repetir el bucle
                        RET                             ; Retorna de la subrutina

; Rutina para calcular la resta de los n�meros y decidir si es positiva o negativa
CALCULAPOSNEG:
                        LD A, (HL)                      ; Cargar A con el valor de la direcci�n apuntada por HL (num1)
                        LD C, (DE)                      ; Cargar C con el valor de la direcci�n apuntada por DE (num2)
                        SUB C                           ; Restar C de A
                        CALL M, ES_NEGATIVO             ; Si el resultado es negativo (M = 1), llama a ES_NEGATIVO
                        LD (IX), 1                      ; Si el resultado es positivo (M = 0), guarda 1 en la direcci�n apuntada por IX
                        INC HL                          ; Incrementar HL para apuntar al siguiente n�mero en NUM1
                        INC DE                          ; Incrementar DE para apuntar al siguiente n�mero en NUM2
                        INC IX                          ; Incrementar IX para apuntar a la siguiente direcci�n para los resultados
                        DEC BC                          ; Decrementar BC
                        LD A, B                         ; Comprobar si B es cero
                        OR C                            ; Comprobar si C es cero
                        JR NZ, CALCULAPOSNEG            ; Si BC no es cero, repetir el bucle
                        RET                             ; Retorna de la subrutina

; Rutina para manejar los resultados negativos
ES_NEGATIVO:
                        LD (IX), 0                      ; Guardar 0 en la direcci�n apuntada por IX si el resultado es negativo
                        RET                             ; Retorna de la subrutina

NUM1:                   DB 7, 4, 2, 10, 4, 1, 3         ; Array NUM1
NUM2:                   DB 5, 6, 9, 9, 1, 0, 4          ; Array NUM2






                        halt                            ; Replace these lines with your code
                        jp AppEntry                     ;


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


