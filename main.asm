;SUPER PROYECTO ASM "Skanes and Dellar"
;
;Antony
;Brandon 
;Alex ╭∩╮(-_-)╭∩╮
;
;=======================================#
;             ____
;            / . .\
;            \  ---<
;             \  /
;   __________/ /
;-=:___________/
;                          ╬═╬
;                          ╬═╬
;                          ╬═╬
;                          ╬═╬
;                          ╬═╬
;
;========================================#

;variables de dado ╭∩╮(-_-)╭∩╮
semilla db 7
dado db 0

;╭∩╮(-_-)╭∩╮
act_semilla:
    mov ah, 0 
    int 1Ah
    mov al, dl 
    mov [semilla], al
    ret

;╭∩╮(-_-)╭∩╮
generar_dado:
    call act_semilla;actualiza la semilla usando los ticks de este momento instante espacio temporal actual inmediato ahora ya jsjshs
    mov al, [semilla] ;carga semilla en al
    mov ah, 0 ;limpia ah para la división
    mov bl, 6 ;mueve 6 a bl
    div bl ;divide ax entre bl
    mov al, ah ; pone el residuo en al
    add al, 1 ;suma 1 a al para tener un valor del 1 al 6
    mov [dado], al ; mueve al a la variable dado
    ret

; - - - TABLA DE REGISTRO - - -
section .data
    registro_table dd registro_pj1, registro_pj2, registro_pj3, registro_pj4, registro_pj5

section .text

; - - - INICIO DE MOVIMIENTO
main:
    mov eax, [personajes]
    cmp eax, 5 ; Verifica que el número de jugadores sea válido (0 a 4)
    ja fin ; si es mayor que 4, termina

    call turno_jugador 
    jmp main

turno_jugador:
    
    call generar_dado ; Llama al generador de dado

    mov eax, [dado]
    mov [movimiento], eax ; Guarda el resultado del dado en la variable "movimiento"

    mov ecx, [personaje_seleccionado]     ; ecx = índice de jugador actual

    mov ebx, [registro_table + ecx*4]     ; ebx = dirección del registro de jugador 
    add [ebx], eax                        ; suma el dado al registro

    inc ecx ; Avanza al siguiente jugador
    cmp ecx, [personajes]
    jl seguir
    xor ecx, ecx                          ; si ya jugaron todos, vuelve al jugador 0

seguir:
    mov [personaje_seleccionado], ecx
    ret

fin:
    ret ; todavia esta en proceso

;╭∩╮(-_-)╭∩╮
tablero db 37, 0, 0, 10, 0, 0, 0, 21, 0, 0
        db 0, 0, 0, 0, 0, 0, -10, 0, 0, 0
        db 0, 0, 0, 16, 0, 0, 0, 0, 56, 0
        db 0, 0, 0, -22, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, -21, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, -43, 0, 0
        db 0, 19, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        db 0, 0, 0, 0, -20, 0, 0, 0, 0, -20
        db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;╭∩╮(-_-)╭∩╮

gui_tablero db 'Ⅰ','⛚','⛚','Ⅱ','⛚','⛚','⛚','Ⅲ','⛚','⛚'
             db '⛚','⛚','⛚','⛚','⛚','⁎','⛚','⛚','⛚','⛚'
             db '⛚','⛚','⛚','Ⅳ','⛚','⛚','⛚','⛚','Ⅴ','⛚'
             db '⛚','⛚','⛚','★','⛚','⛚','⛚','⛚','Ⅰ','⛚'
             db '⛚','⛚','⛚','⛚','⛚','⁑','⛚','⛚','Ⅰ','⛚'
             db '⛚','Ⅵ','⛚','⛚','⛚','⁂','⛚','⛚','⛚','⛚'
             db '⛚','⛚','⛚','𖤐','⛚','⛚','⛚','⛚','⛚','⛚'
             db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
             db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
             db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
             db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
             db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'