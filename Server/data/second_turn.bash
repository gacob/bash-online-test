#!/bin/bash

second_turn() {
    current=$NCAT_REMOTE_ADDR
    current="${current//./}"
    
    echo Actual: $NCAT_REMOTE_ADDR
    echo $current
    
    if [[ "$current" -eq "$cliente_ip_2" ]]; then
        echo "Turno del Jugador 2"
        echo ¿Cuánto daño vas a hacer?
        read -r my_damage

        first_hp=$(( first_hp - my_damage ))
        echo Has hecho "$my_damage" > server_data
        echo "Al Jugador 1 le queda $first_hp" >> server_data
        my_damage=0
    
    else
        echo Es el turno del rival
    fi
}