#!/bin/bash


# Source
source data/inicio.bash
source data/first_turn.bash
source data/second_turn.bash


# Iniciar el servidor
start_server() {
    echo "Esperando a los dos jugadores..."

    # Crear un socket en el puerto 12345
    touch server_data
    touch list_ip
    count=0

    # < = Leer
    # > = Escribir
    ncat -m 2 -klvp 8080 -e "data/inicio.bash"
    rm list_ip
    rm server_data
}

start_server
