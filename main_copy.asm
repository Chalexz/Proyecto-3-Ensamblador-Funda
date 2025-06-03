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
    push dword 0
    call time           
    add esp, 4
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
    registro_turno_pj1 dd 0
    registro_turno_pj2 dd 0
    registro_turno_pj3 dd 0
    registro_tunro_pj4 dd 0
    registro_tunro_pj5 dd 0

    ; Posición actual de cada jugador en el tablero
    movimiento_pj1 dd 1
    movimiento_pj2 dd 0
    movimiento_pj3 dd 0
    movimiento_pj4 dd 0
    movimiento_pj5 dd 0

    ; Variables de dado ╭∩╮(-_-)╭∩╮
    semilla db 7
    dado db 0

    ; Resultado del dado actual
    movimiento dd 0

    resultado_dado db 0


    ; Tablas para acceso según jugador
    ;registro_turnos_table dd registro_turno_pj1, registro_turno_pj2, registro_turno_pj3, registro_turno_pj4, registro_turno_pj5
    movimiento_table dd movimiento_pj1, movimiento_pj2, movimiento_pj3, movimiento_pj4, movimiento_pj5

    ; Limpiara la consola, es un uso estetico
    limpiar_consola db "clear", 0

    ; Representaciones de los jugadores
    jugador_uno dd "𖨆",0
    jugador_dos dd "ඩ",0
    jugador_tres dd "☹",0
    jugador_cuatro dd "☺",0
    jugador_cinco dd "ⶆ",0


    ; Registro de turno para cada jugador
    turnos_jugador_uno db 0
    turnos_jugador_dos db 0
    turnos_jugador_tres db 0
    turnos_jugador_cuatro db 0 
    turnos_jugador_cinco db 0

    registro_turnos_table dd turnos_jugador_uno, turnos_jugador_dos, turnos_jugador_tres, turnos_jugador_cuatro, turnos_jugador_cinco

    mensaje_menu_seleccion_jugadores db "Bienvenido al Menu de Seleecion",10, 0
    opciones_menu_seleccion db "(1) - Un jugador",10,"(2) - Dos jugadores",10,"(3) - Tres jugadores",10,"(4) - Cuatro jugadores",10,"(5) - Cinco jugadores",10,10,0
    ingresar_cantidad_jugadores db "Ingrese el numero de la opcion que desea realizar: ",0
    formato_opcion db "%d",0
    formato_numero db "%d",10,0
    mensaje_opcion_invalida db 10,"Error: La opcion ingresada es invalida!",10,10,0

    mensaje_tirar_dado db "Presione 'Enter' para tirar el dado (R para reiniciar la partida): ",0
    opcion_invalida_dado db 10,"Error: Por favor presione 'Enter' o 'R'",10,0

    mensaje_avance db "El jugador  %s# avanza: '%d' casillas!",10,0
    mensaje_resultado_dado db "El resultado del dado es: %d!!!",10,0
    mensaje_nueva_posicion db "La nueva posicion del jugador <insertar jugador> es la casilla: %d!!!",10,0
    mensaje_turnos_jugador db "El jugador %d ha jugado ya %d turnos ヾ(⌐■_■)ノ♪",10,0

    mensaje_victoria db 10,"¡Victoria! El jugador %d ha llegado a la meta!",10,0
    mensaje_posicion_final db "Jugador %d terminó en la casilla %d",10,0
    mensaje_turnos_final db "Turnos totales del ganador: %d",10,0

    snake01 db"                 /^\/^\",10
            db"               _|__|  O|",10
            db"      \/     /~     \_/ \",10
            db"       \____|__________/  \",10
            db"              \_______      \",10
            db"                      `\     \",10, 0

    snake02 db"                 /^\/^\",10
            db"               _|__|  -|",10
            db"      \/     /~     \_/ \",10
            db"       \____|__________/  \",10
            db"              \_______      \",10
            db"                      `\     \",10, 0

    escalera01 db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"           \ o /",10
               db"             |",10
               db"            / \",10,0


    escalera02 db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"           \ o /",10
               db"             |",10
               db"            / \",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10,0

    escalera03 db"            ╬═╬",10
               db"           \ o /",10
               db"             |",10
               db"            / \",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10
               db"            ╬═╬",10,0

    dado_1 db "  .-------.",10
           db " /   o   /|",10
           db "/_______/o|",10
           db "|       | |",10
           db "|   o   |o/",10
           db "|       |/",10
           db "'-------'",10,0
    
    dado_2 db "  .-------.",10
           db " /   o   /|",10
           db "/_______/o|",10
           db "| o     | |",10
           db "|       |o/",10
           db "|     o |/",10
           db "'-------'",10,0

    dado_3 db "  .-------.",10
           db " /   o   /|",10
           db "/_______/o|",10
           db "| o     | |",10
           db "|   o   |o/",10
           db "|     o |/",10
           db "'-------'",10,0

    dado_4 db "  .-------.",10
           db " /   o   /|",10
           db "/_______/o|",10
           db "| o   o | |",10
           db "|       |o/",10
           db "| o   o |/",10
           db "'-------'",10,0

    dado_5 db "  .-------.",10
           db " /   o   /|",10
           db "/_______/o|",10
           db "| o   o | |",10
           db "|   o   |o/",10
           db "| o   o |/",10
           db "'-------'",10,0

    dado_6 db "  .-------.",10
           db " /   o   /|",10
           db "/_______/o|",10
           db "| o   o | |",10
           db "| o   o |o/",10
           db "| o   o |/",10
           db "'-------'",10,0
    
    ;╭∩╮(-_-)╭∩╮
tablero db 0,0,0,0,0,0,0,0,22,0
        db 0,0,0,0,0,0,0,0,0,0
        db 0,0,0,34,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,-44,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,0,0,0,0,0
        db 0,0,0,0,0,-19,0,0,0,0


    ;╭∩╮(-_-)╭∩╮
    gui_tablero gui_tablero db \
                        "  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  Ⅱ  ","  ⛚  ",10,10
                        "  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ,"  ⛚  ","  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ",10,10
                        "  ⛚  ,"  "  ⛚  ","  ⛚  ,"  Ⅲ  ","  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ",10,10
                        "  Ⅱ  ,"  ⛚  ,"  ✪  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ",10,10
                        "  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ",10,10
                        "  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  Ⅲ  ,"  ⛚  ,"  ⛚  ",10,10
                        "  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ",10,10
                        "  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  𖤐  ,"  ⛚  ,"  ⛚  ",10,10
                        "  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ",10,10
                        "  Ⅰ  ,"  ⛚  ,"  𖤐  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  ⛚  ,"  Ⅰ  ",10,10,0

     respaldo_gui_tablero 
                db "  Ⅰ  ","  ⛚  ","  ⛚  ","  Ⅱ  ","  ⛚  ","  𖥟  ","  ⛚  ","  ⛚  ","  Ⅲ  ","  ⛚  ",10,\
                "  ⛚  ","  ⛚  ","  ⛚  ","  Ⅱ  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  𖣔  ",10,\
                "  Ⅳ  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ","  Ⅴ  ","  ⛚  ","  ⛚  ",10,\
                "  ⅗  ","  ⛚  ","  ⛚  ","  ⛚  ","  ⛚  ,","  ✪  ","  ⛚  ","  Ⅰ  ","  ⛚  ","  ⛚  ",10,\
                "  Ⅳ  ","  ⛚  ","  ⛚  ","  ⛚  ","  Ⅵ  ","  ⛚  ,","  ⛚  ,","  ⛚  ","  ⛚  ,","  ⛚  ",10,\
                "  Ⅶ  ","  ⛚  ","  ⛚  ,","  𖤐  ","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ",10,\
                "  ⛚  ,","  ⛚  ,","  𖣔  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  Ⅶ  ,","  ⛚  ,","  ⛚  ,","  ⛚  ",10,\
                "  ⛚  ,","  Ⅷ  ,","  ⁂  ,","  ⛚  ,","  ⁑  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ",10,\
                "  ⛚  ,","  ⛚  ,","  ⛚  ,","  Ⅴ  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⁎  ,","  ⛚  ",10,\
                "  ⁂  ,","  ⛚  ,","  ⁑  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⛚  ,","  ⁎  ",10,10,0
                ;db 0

   ;Los jugadores serán 𝟭, 𝟮, 𝟯, 𝟰, 𝟱
;También los jugadores pueden ser: 𖨆, ⶆ, ඩ, ☹, ☺
;Serpientes: ⁎, ⁑, ⁂, ★, 𖤐, 𖣔, ✪, 𖥟
;Escaleras: ▤, ▥, ▦, 𖣯, ▚, ▩, ⿴, ◪
;Escaleras: Ⅰ, Ⅱ, Ⅲ, Ⅳ, Ⅴ, Ⅵ, Ⅶ, Ⅷ             

    lista_dados dd dado_1, dado_2, dado_3, dado_4, dado_5, dado_6 
    lista_skane dd snake01, snake02, snake01, snake02
    lista_dellar dd escalera01, escalera02, escalera03

    mensa_debug db "Prueba",10,0
    mensa_debug2 db "Prueba2",10,0


section .bss
    opcion resb 1
    ultima_cara_dado resb 1
    posicion_jugador resb 1




section .text
    global main
    extern printf, getchar, scanf, system, sleep, time ; Librerias usadaa 


main:
   call limpiar_cmd
   jmp menu_selccion_jugadores
   

limpiar_cmd:
    push limpiar_consola
    call system
    add esp,4
    ret 


menu_selccion_jugadores:
    call imprimir_menu_seleccion
    
    push opcion
    push formato_opcion
    call scanf
    add esp, 8

    sub byte [opcion], 1

    cmp byte [opcion], 0
    jl imprimir_opcion_invalida_menu
    cmp byte [opcion], 4
    jg imprimir_opcion_invalida_menu

 
; - - - INICIO DE MOVIMIENTO
    mov eax, [opcion]
    mov [personajes], eax

    push dword [personajes]
    push formato_opcion
    call printf
    add esp, 8

    call vaciar_buffer
    
    ;ret
    jmp tirar_dado
    ;call turno_jugador 


imprimir_menu_seleccion:
    push mensaje_menu_seleccion_jugadores
    call printf
    add esp, 4

    push opciones_menu_seleccion
    call printf
    add esp, 4

    push ingresar_cantidad_jugadores
    call printf
    add esp, 4

    ret   


vaciar_buffer:
    call getchar
    cmp al, 0x0A
    jne vaciar_buffer

    ret 


imprimir_opcion_invalida_menu:
    call vaciar_buffer

    push mensaje_opcion_invalida
    call printf
    add esp, 4

    jmp menu_selccion_jugadores


imprimir_opcion_invalida:
    call vaciar_buffer

    push opcion_invalida_dado
    call printf
    add esp, 4

    jmp tirar_dado


tirar_dado:
    push mensaje_tirar_dado
    call printf
    add esp, 4

    call getchar

    cmp al, 0x0A
    jne imprimir_opcion_invalida
    

    mov esi, lista_dados
    mov ecx, 6

animacion_dado:
    ; Guarda ECX en la pila para preservarlo
    push ecx    

    call limpiar_cmd          

    push dword[esi]
    call printf
    add esp, 4
    add esi, 4
    
    push dword 1
    call sleep
    add esp, 4
   
    pop ecx               

    loop animacion_dado

    ; push dword 1
    ; call sleep
    ; add esp, 4

    call limpiar_cmd
    jmp indentificar_cara_dado
    
animacion_skane:

    mov esi, lista_skane
    mov ecx, 4

siguiente_animacion_skane: 
    push ecx    

    call limpiar_cmd          

    push dword[esi]
    call printf
    add esp, 4
    add esi, 4
    
    push dword 1
    call sleep
    add esp, 4
   
    pop ecx     

    loop siguiente_animacion_skane
    
    jmp regreso_flujo

animacion_dellar:

    mov esi, lista_dellar
    mov ecx, 3

siguiente_animacion_dellar: 
    push ecx    

    call limpiar_cmd          

    push dword[esi]
    call printf
    add esp, 4
    add esi, 4
    
    push dword 1
    call sleep
    add esp, 4
   
    pop ecx     

    loop siguiente_animacion_dellar
    
    jmp regreso_flujo

imprimir_menu:
    push gui_tablero
    call printf
    add esp, 4

    push resultado_dado
    push mensaje_resultado_dado
    call printf
    add esp, 8







indentificar_cara_dado:
    call generar_dado

    ; movzx eax, byte [dado]
    ; push eax
    ; push formato_opcion
    ; call printf
    ; add esp, 8

    ; push mensa_debug2
    ; call printf
    ; add esp, 4

    cmp byte [dado], 1
    je cara_uno
    cmp byte [dado], 2
    je cara_dos
    cmp byte [dado], 3
    je cara_tres
    cmp byte [dado], 4
    je cara_cuatro
    cmp byte [dado], 5
    je cara_cinco
    
    mov eax, dado_6
    mov [ultima_cara_dado], eax

    push dword[ultima_cara_dado]
    call printf
    add esp, 4

    jmp imprimir_mensaje_turno


cara_uno:
    mov eax, dado_1
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4

    jmp imprimir_mensaje_turno


cara_dos:
    mov eax, dado_2
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4
    jmp imprimir_mensaje_turno


cara_tres:
    mov eax, dado_3
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4
    
    jmp imprimir_mensaje_turno


cara_cuatro:
    mov eax, dado_4
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4
    jmp imprimir_mensaje_turno


cara_cinco:
    mov eax, dado_5
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4


imprimir_mensaje_turno: 
   

    ; cmp ecx, 0
    ; je total_turnos_jugador_uno
    ; cmp ecx, 1
    ; je total_turnos_jugador_uno
    ; cmp ecx, 2
    ; je total_turnos_jugador_uno
    ; cmp ecx, 3
    ; je total_turnos_jugador_uno
    ; cmp ecx, 4
    ; je total_turnos_jugador_uno
    ; push ecx

    ; push formato_opcion
    ; call printf
    ; add esp, 4
    
    ;ret

    mov ecx, [personaje_seleccionado]    ; ecx = índice de jugador actual

turno_jugador:
    movzx eax, byte [dado]
    mov [movimiento], eax                ; Guarda el resultado de dado en [movimiento]
    mov [resultado_dado], eax
    ; --- ACTUALIZAR EL REGISTRO DE LOS JUGADORES ---
    mov ebx, [registro_turnos_table + ecx*4]    
    add [ebx], byte 1 ; Añade el resultado del dado en la dirección de ebx(tabla de registro)

    ; mov eax, [ebx]
    ; mov [posicion_jugador], eax

    ; mov eax, [movimiento]

    ;  ;movzx eax, byte [dado]
    ; push dword[resultado_dado]
    ; ;push dword[movimiento]
    ; push formato_numero
    ; call printf
    ; add esp, 8   


    ;movzx eax, byte [dado]
    ;push dword[posicion_jugador]
    ;push dword[movimiento]

    ; todo bien :D
    ; --- AVANZAR DE POSICIÓN ---
    
    mov ebx, [movimiento_table + ecx*4]  ; mete en ebx la DIRECCION DE LA VARIABLE DE POSICIONDEL JUGADOR ACTUAL
    add [ebx], eax                        ; suma el resultado del último dado a la posicion del jugador actual
    mov eax, [ebx]                        ; carga la nueva posicion del jugador en eax

    ; MOSTRAR RESULTADO DEL DADO
    push dword [resultado_dado]
    push mensaje_resultado_dado
    call printf
    add esp, 8

    ; MOSTRAR NUEVA POSICIÓN DEL JUGADOR
    push eax
    push mensaje_nueva_posicion
    call printf
    add esp, 8

    ; MOSTRAR TURNOS JUGADOS POR CADA JUGADOR
    mov esi, 0
.mostrar_turnos:
    cmp esi, [personajes]
    jge .fin_mostrar_turnos
    mov ebx, [registro_turnos_table + esi*4]
    mov eax, esi
    add eax, 1
    push dword [ebx]
    push eax
    push mensaje_turnos_jugador
    call printf
    add esp, 12
    inc esi
    jmp .mostrar_turnos
.fin_mostrar_turnos:

    ; mov eax, [ebx]
    ; mov [posicion_jugador], eax
    ; todo biennnn 2 

    push dword[posicion_jugador]
    push formato_opcion
    call printf
    add esp, 8
    ret ; todavia esta en proceso

    ; --- Obtener efecto de la casilla actual ---
    mov edx, [ebx]                       ; edx = posición actual
    cmp edx, 99                          ; Posición actual <= casilla 100
    ja fuera_del_tablero                 ; Fuera del tablero
    movsx edx, byte [tablero + edx]      ; edx = efecto de la casilla
    
    ;sub edx, 1

    ; paso critico para la anicmacion
    cmp edx, 0
    jl animacion_skane
    cmp edx, 6
    jg animacion_dellar

regreso_flujo:
    ; --- Aplicar efecto de casilla ---
    add [ebx], edx

    call limpiar_cmd
    
    push dword 1
    call sleep
    add esp, 4

    call imprimir_menu

    ret ; todavia esta en proceso

    ; --- JUGADOR MENOR QUE 0 ---
    cmp dword [ebx], 0
    jge continuar
    mov dword [ebx], 0                   ; Si se pasó por debajo de 0, regresa a 0

continuar:
    ; Avanzar al siguiente jugador
    inc ecx
    cmp ecx, [personajes]
    jl seguir
    xor ecx, ecx                          ; volver al jugador 0 si todos jugaronno

seguir:
    mov [personaje_seleccionado], ecx
    ret

fuera_del_tablero:  ; deberia ganar el juego
    ; Si se pasa del tablero, lo dejamos en la última casilla
    mov dword [ebx], 99 ; casilla 100

    ; MENSAJE DE VICTORIA Y STATS FINALEs ╭∩╮(-_-)╭∩╮
    push ecx                          ; guarda ecx en la pila para no perder el valor original
    mov ecx, [personaje_seleccionado] ; carga el índice del jugador ganador en ecx
    add ecx, 1                        ; suma 1 para mostrar el número de jugador
    push ecx                          ; pone el número de jugador ganador en la pila
    push mensaje_victoria             ; pone el mensaje de victoria en la pila
    call printf                       ; imprime el mensaje de victoria
    add esp, 8                        ; limpia la pila 

    ; POSICIONES DE TODOS LOS JUGADORES ╭∩╮(-_-)╭∩╮
    mov esi, 0                        ; limpia esi para recorrer todos los jugadores
.mostrar_posiciones:
    cmp esi, [personajes]             ; compara esi con el número total de jugadores
    jge .fin_mostrar_pos              ; si ya mostró todos, termina
    mov ebx, [movimiento_table + esi*4] ; obtiene la dirección de la posición del jugador actual
    mov eax, [ebx]                    ; carga la posición del jugador actual en eax
    add esi, 1                        ; suma 1 a esi para mostrar el número de jugador 
    push eax                          ; pone la posición del jugador en la pila
    push esi                          ; pone el número de jugador en la pila
    push mensaje_posicion_final        ; pone el mensaje de posición final en la pila
    call printf                       ; imprime el mensaje de posición final
    add esp, 12                       ; limpia la pila
    dec esi                           ; restaura el valor de esi para el bucle
    inc esi                           ; incrementa esi para el siguiente jugador
    jmp .mostrar_posiciones           ; repite para el siguiente jugador
.fin_mostrar_pos:

    ; TURNOS DEL GANADOR ╭∩╮(-_-)╭∩╮
    mov ebx, [registro_turnos_table + [personaje_seleccionado]*4] ; obtiene la dirección del registro de turnos del ganador
    mov eax, [ebx]                    ; carga el número de turnos del ganador en eax
    push eax                          ; pone el número de turnos en la pila
    push mensaje_turnos_final         ; pone el mensaje de turnos finales en la pila
    call printf                       ; imprime el mensaje de turnos finales
    add esp, 8                        ; limpia la pila donde habían dos cosas 

    pop ecx                           ; restaura el valor original de ecx

    ; PORFAVOR AGREGASR LOGICA DE REINICIO O DE CERRAR JUEGO ╭∩╮(-_-)╭∩╮
    ret
