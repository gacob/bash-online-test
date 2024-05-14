#!/bin/bash

inicio() {

   # Contador para asignar IP a jugadores
   case $count in
    0)  cliente_ip_1=$NCAT_REMOTE_ADDR
        echo $cliente_ip_1
        count=$(( count + 1 ))
        ;;
    1) cliente_ip_2=$NCAT_REMOTE_ADDR
        echo $cliente_ip_2
        count=$(( count + 1 ))
        ;;
    2) echo No admite más conexiones
    exit
   esac

    # Almacenamos las IP para Debug
    $cliente_ip_1 > list_ip
    $cliente_ip_2 >> list_ip


    # Turno aleatorio. Se sale del turno al morir
    randomturn=$(( RANDOM%1 ))
    while [[ $first_hp -gt 0 && $second_hp -gt 0 ]]; do
        if [[ $randomturn -eq 0 ]]; then
            first_turn
            second_turn
        else
            second_turn
            first_turn
        fi
    done

    # Comprueba ganador
    if [[ $firt_hp -le 0 ]]; then
        echo "El Jugador 1 ha ganado" > server_data
    
    else
        echo "El Jugador 2 ha ganado" > server_data
    fi

    # Reinicio de variables
    first_hp=0
    second_hp=0
    count=0
}

