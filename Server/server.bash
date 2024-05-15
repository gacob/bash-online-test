#!/bin/bash

source data/inicio.bash

# Iniciar el servidor
start_server() {
    echo "Esperando a los dos jugadores..."

    # Crear un socket en el puerto 12345
    touch list_ip
    export count=1
    export first_hp=100
    export second_hp=100

    # < = Leer
    # > = Escribir
    ncat -m 2 -klv localhost 8080 -e "data/inicio.bash"
}

start_server
