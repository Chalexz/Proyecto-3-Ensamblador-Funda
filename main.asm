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

personaje_seleccionado db 0 ; Personaje que le toca jugar

movimiento db 0

;variables de dado ╭∩╮(-_-)╭∩╮
semilla db 7
dado db 0

; - - - REGISTROS DE JUGADORES - - -

registro_pj1 db 0

registro_pj2 db 0

registro_pj3 db 0

registro_pj4 db 0

registro_pj5 db 0

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

; - - - COMPARACIÓN DE JUGADORES - - -

main:
    call generar_dado
    cmp [personajes], 0
        je jugadores_1

    cmp [personajes], 1
        je jugadores_2

    cmp [personajes], 2
        je jugadores_3

    cmp [personajes], 3
        je jugadores_4

    cmp [personajes], 4
        je jugadores_5

; - - - 1 JUGADORES - - -

jugadores_1:
cmp [personaje_seleccionado], 0
je movimiento_1

movimiento_1:
mov [movimiento], [dado]
add [registro_pj1], [dado]
ret jugadores_1

; - - - 2 JUGADORES - - -

jugadores_2:
cmp [personaje_seleccionado], 0
    je movimiento_1

cmp [personaje_seleccionado], 1
    je movimiento_2

movimiento_1:
    mov [movimiento], [dado]
    add [registro_pj1], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_2

movimiento_2:
    mov [movimiento], [dado]
    add [registro_pj2], [dado]
    mov [personaje_seleccionado], 0
    ret jugadores_2

; - - - 3 JUGADORES - - -

jugadores_3:
cmp [personaje_seleccionado], 0
    je movimiento_1

cmp [personaje_seleccionado], 1
    je movimiento_2

cmp [personaje_seleccionado], 2
    je movimiento_3


movimiento_1:
    mov [movimiento], [dado]
    add [registro_pj1], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_3

movimiento_2:
    mov [movimiento], [dado]
    add [registro_pj2], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_3

movimiento_3:
    mov [movimiento], [dado]
    add [registro_pj3], [dado]
    mov [personaje_seleccionado], 0
    ret jugadores_3

; - - - 4 JUGADORES - - -

jugadores_4:
cmp [personaje_seleccionado], 0
    je movimiento_1

cmp [personaje_seleccionado], 1
    je movimiento_2

cmp [personaje_seleccionado], 2
    je movimiento_3

cmp [personaje_seleccionado], 3
    je movimiento_4


movimiento_1:
    mov [movimiento], [dado]
    add [registro_pj1], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_4

movimiento_2:
    mov [movimiento], [dado]
    add [registro_pj2], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_4

movimiento_3:
    mov [movimiento], [dado]
    add [registro_pj3], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_4

movimiento_4:
    mov [movimiento], [dado]
    add [registro_pj4], [dado]
    mov [personaje_seleccionado], 0
    ret jugadores_4

; - - - 5 JUGADORES - - -

jugadores_5:
cmp [personaje_seleccionado], 0
    je movimiento_1

cmp [personaje_seleccionado], 1
    je movimiento_2

cmp [personaje_seleccionado], 2
    je movimiento_3

cmp [personaje_seleccionado], 3
    je movimiento_4

cmp [personaje_seleccionado], 4
    je movimiento_5


movimiento_1:
    mov [movimiento], [dado]
    add [registro_pj1], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_5

movimiento_2:
    mov [movimiento], [dado]
    add [registro_pj2], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_5

movimiento_3:
    mov [movimiento], [dado]
    add [registro_pj3], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_5

movimiento_4:
    mov [movimiento], [dado]
    add [registro_pj4], [dado]
    add [personaje_seleccionado], 1
    ret jugadores_5

movimiento_5:
    mov [movimiento], [dado]
    add [registro_pj5], [dado]
    mov [personaje_seleccionado], 0
    ret jugadores_5

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