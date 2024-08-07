; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "NewFile"                   ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+


; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application

AppEntry                LD HL, 8100H                    ; HL apunta a la direcci�n de memoria 8100H
                        LD C, 10                        ; C contiene el n�mero de t�rminos a generar (por ejemplo, 10 t�rminos)
                        LD B, 0                         ; B almacena el t�rmino anterior (F(n-2)), inicializado a 0
                        LD D, 1                         ; D almacena el t�rmino actual (F(n-1)), inicializado a 1
                        LD A, B                         ; A almacena el t�rmino actual en la secuencia

fib_loop                LD (HL), A                      ; Guardar el t�rmino actual en la direcci�n de memoria apuntada por HL
                        INC HL                          ; Incrementar HL para apuntar a la siguiente direcci�n de memoria

                        LD A, D                         ; A <- D (nuevo t�rmino actual en la secuencia)
                        ADD A, B                        ; A <- A + B (nuevo t�rmino siguiente en la secuencia)
                        LD B, D                         ; B <- D (actualizar el t�rmino anterior)
                        LD D, A                         ; D <- A (actualizar el t�rmino actual)

                        DEC C                           ; Decrementar el contador de t�rminos
                        JR NZ, fib_loop                 ; Si C no es cero, repetir el bucle

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


