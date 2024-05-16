#!/bin/bash

source data/first_turn.bash
source data/second_turn.bash

inicio() {
    
   # Contador para asignar IP a jugadores
   case $count in
    1)  cliente_ip_1=$NCAT_REMOTE_ADDR
        cliente_ip_1="${cliente_ip_1//./}"
        echo Esta es tu IP: "$cliente_ip_1"
        count=$(( count + 1 ))
        ;;
   esac

    # Wait Room
    echo Esperando a los dos jugadores...

    # Almacenamos las IP para Debug
    echo $cliente_ip_1 >> list_ip
    cliente_ip_1=$( sed -n 1p list_ip )
    while [[ $cliente_ip_1 != "" && $cliente_ip_2 == "" ]]; do
        cliente_ip_2=$( sed -n 2p list_ip )
    done

    echo "ip 1" $cliente_ip_1
    echo "ip 2" $cliente_ip_2

    # Turno aleatorio. Se sale del turno al morir
    randomturn=$(( RANDOM%1 ))
    while [[ $first_hp -gt 0 && $second_hp -gt 0 && $cliente_ip_1 != "" && $cliente_ip_2 != "" ]]; do
        if [[ $randomturn -eq 0 ]]; then
            first_turn
            second_turn
        else
            second_turn
            first_turn
        fi
    done

    # Comprueba ganador
    if [[ $first_hp -le 0 ]]; then
        echo "El Jugador 1 ha ganado" > server_data
    
    else
        echo "El Jugador 2 ha ganado" > server_data
    fi

    # Reinicio de variables
    first_hp=0
    second_hp=0
    count=0
}

inicio