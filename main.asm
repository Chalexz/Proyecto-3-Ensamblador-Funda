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

    ; Variables de dado ╭∩╮(-_-)╭∩╮
    semilla db 7
    dado db 0

    ; Resultado del dado actual
    movimiento dd 0

    ; Tablas para acceso según jugador
    registro_table dd registro_pj1, registro_pj2, registro_pj3, registro_pj4, registro_pj5
    movimiento_table dd movimiento_pj1, movimiento_pj2, movimiento_pj3, movimiento_pj4, movimiento_pj5

    ; Limpiara la consola, es un uso estetico
    limpiar_consola db "clear", 0

    ;Representaciones de los jugadores
    jugador_uno dd "𝟭",0
    jugador_dos dd "𝟮",0
    jugador_tres dd "𝟯",0
    jugador_cuatro dd "𝟰",0
    jugador_cinco dd "𝟱",0

    mensaje_menu_seleccion_jugadores db "Bienvenido al Menu de Seleecion",10, 0
    opciones_menu_seleccion db "(1) - Un jugador",10,"(2) - Dos jugadores",10,"(3) - Tres jugadores",10,"(4) - Cuatro jugadores",10,"(5) - Cinco jugadores",10,10,0
    ingresar_cantidad_jugadores db "Ingrese el numero de la opcion que desea realizar: ",0
    formato_opcion db "%d",0
    mensaje_opcion_invalida db 10,"Error: La opcion ingresada es invalida!",10,10,0

    mensaje_tirar_dado db "Presione 'Enter' para tirar el dado (R para reiniciar la partida): ",0
    opcion_invalida_dado db 10,"Error: Por favor presione 'Enter' o 'R'",10,0

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

    lista_dados dd dado_1, dado_2, dado_3, dado_4, dado_5, dado_6 

    mensa_debug db "Prueba",10,0
    mensa_debug2 db "Prueba2",10,0


section .bss
    opcion resb 1
    ultima_cara_dado resb 1


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
    mov ebx,0

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
    push mensa_debug
    call printf
    add esp, 4


indentificar_cara_dado:
    ; push mensa_debug2
    ; call printf
    ; add esp, 4
    push jugador_uno
    call printf
    add esp, 4

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



cara_uno:
    mov eax, dado_1
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4

    ret
cara_dos:
    mov eax, dado_2
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4
    ret
cara_tres:
    mov eax, dado_3
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4
    ret

cara_cuatro:
    mov eax, dado_4
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4
    ret
cara_cinco:
    mov eax, dado_5
    mov [ultima_cara_dado], eax   

    push dword[ultima_cara_dado]
    call printf
    add esp, 4

 fin_animacion_dado:
     ret



;empiza lo lindo
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


; ;╭∩╮(-_-)╭∩╮
; tablero db 37, 0, 0, 10, 0, 0, 0, 21, 0, 0
;         db 0, 0, 0, 0, 0, 0, -10, 0, 0, 0
;         db 0, 0, 0, 16, 0, 0, 0, 0, 56, 0
;         db 0, 0, 0, -22, 0, 0, 0, 0, 0, 0
;         db 0, 0, 0, 0, 0, -21, 0, 0, 0, 0
;         db 0, 0, 0, 0, 0, 0, 0, -43, 0, 0
;         db 0, 19, 0, 0, 0, 0, 0, 0, 0, 0
;         db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;         db 0, 0, 0, 0, -20, 0, 0, 0, 0, -20
;         db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
; ;╭∩╮(-_-)╭∩╮

; gui_tablero db 'Ⅰ','⛚','⛚','Ⅱ','⛚','⛚','⛚','Ⅲ','⛚','⛚'
;              db '⛚','⛚','⛚','⛚','⛚','⁎','⛚','⛚','⛚','⛚'
;              db '⛚','⛚','⛚','Ⅳ','⛚','⛚','⛚','⛚','Ⅴ','⛚'
;              db '⛚','⛚','⛚','★','⛚','⛚','⛚','⛚','Ⅰ','⛚'
;              db '⛚','⛚','⛚','⛚','⛚','⁑','⛚','⛚','Ⅰ','⛚'
;              db '⛚','Ⅵ','⛚','⛚','⛚','⁂','⛚','⛚','⛚','⛚'
;              db '⛚','⛚','⛚','𖤐','⛚','⛚','⛚','⛚','⛚','⛚'
;              db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
;              db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
;              db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
;              db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
;              db '⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚','⛚'
