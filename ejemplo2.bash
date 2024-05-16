#!/bin/bash

# Función para determinar el ganador
get_winner() {
    player1=$1
    player2=$2

    if [[ $player1 == $player2 ]]; then
        echo "¡Es un empate!"
    elif [[ ($player1 == "piedra" && $player2 == "tijeras") || ($player1 == "papel" && $player2 == "piedra") || ($player1 == "tijeras" && $player2 == "papel") ]]; then
        echo "¡Jugador 1 gana!"
    else
        echo "¡Jugador 2 gana!"
    fi
}

# Iniciar el servidor
start_server() {
    echo "Esperando a los jugadores..."

    # Crear un socket en el puerto 12345
    touch server_pipe

    # < = Leer
    # > = Escribir
    ncat -klvp 8080 < server_pipe | while true; do
        read player1_selection
        echo "$player1_selection" > server_pipe
        read player2_selection
        echo "$player2_selection" > server_pipe
        get_winner "$player1_selection" "$player2_selection"
    done
}

start_server