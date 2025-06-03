movimiento_tablero:

    mov al, [tablero + ebx]              ; Cargar el valor de la casilla actual en al
    cmp al, 0
    jne casilla_especial                 ; Si no es 0, es una casilla especial

    ; Si es 0, limpiar la casilla actual
    mov byte [tablero + ebx], 0       

    ; Colocar el jugador
    mov al, [lista_jugadores + ecx]
    mov [tablero + ebx], al

    ; pasa al siguente jugador
    jmp continuar

casilla_especial:
    add [ebx], al                         

    ; Volver a intentar poner el jugador en la nueva casilla
    jmp movimiento_tablero
