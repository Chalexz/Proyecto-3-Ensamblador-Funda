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


section .data
    ; Número total de jugadores 
    personajes dd 4

    ; Índice del jugador actual (inicia en 0)
    personaje_seleccionado dd 0

    ; Registro de los movimientos de los jugadores
    registro_pj1 dd 0
    registro_pj2 dd 0
    registro_pj3 dd 0
    registro_pj4 dd 0
    registro_pj5 dd 0

    ; Posición actual de cada jugador en el tablero
    movimiento_pj1 dd 0
    movimiento_pj2 dd 0
    movimiento_pj3 dd 0
    movimiento_pj4 dd 0
    movimiento_pj5 dd 0

    ;variables de dado ╭∩╮(-_-)╭∩╮
    semilla db 7
    dado db 0

    ; Resultado del dado actual
    movimiento dd 0

    ; Tablas para acceso según jugador
    registro_table dd registro_pj1, registro_pj2, registro_pj3, registro_pj4, registro_pj5
    movimiento_table dd movimiento_pj1, movimiento_pj2, movimiento_pj3, movimiento_pj4, movimiento_pj5

section .text

; - - - INICIO DE MOVIMIENTO
main:
    mov eax, [personajes]
    cmp eax, 5 ; Verifica que el número de jugadores sea válido (0 a 4)
    ja fin ; si es mayor que 4, termina

    call turno_jugador 
    jmp main

turno_jugador:

    call generar_dado

    mov eax, [dado]
    mov [movimiento], eax                ; Guarda el resultado de dado en [movimiento]

    mov ecx, [personaje_seleccionado]    ; ecx = índice de jugador actual

    ; --- ACTUALIZAR EL REGISTRO DE LOS JUGADORES ---
    mov ebx, [registro_table + ecx*4]    
    add [ebx], eax ; Añade el resultado del dado en la dirección de ebx(tabla de registro)

    ; --- AVANZAR DE POSICIÓN ---
    mov ebx, [movimiento_table + ecx*4]  
    add [ebx], eax ; Añade el resultado del dado en la dirección de ebx(tabla de movimiento)

    ; --- Obtener efecto de la casilla actual ---
    mov edx, [ebx]                       ; edx = posición actual
    cmp edx, 99                          ; Posición actual <= casilla 100
    ja fuera_del_tablero                 ; Fuera del tablero
    movsx edx, byte [tablero + edx]      ; edx = efecto de la casilla

    ; --- Aplicar efecto de casilla ---
    add [ebx], edx

    ; --- JUGADOR MENOR QUE 0 ---
    cmp dword [ebx], 0
    jge continuar
    mov dword [ebx], 0                   ; Si se pasó por debajo de 0, regresa a 0

continuar:
    ; Avanzar al siguiente jugador
    inc ecx
    cmp ecx, [personajes]
    jl seguir
    xor ecx, ecx                          ; volver al jugador 0 si todos jugaron

seguir:
    mov [personaje_seleccionado], ecx
    ret

fuera_del_tablero:
    ; Si se pasa del tablero, lo dejamos en la última casilla
    mov dword [ebx], 99
    jmp continuar

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
