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

    # < = Leer
    # > = Escribir
    ncat -m 2 -eklvp 8080 -e "inicio.bash"
    rm server_data
    rm list_ip
}

start_server
