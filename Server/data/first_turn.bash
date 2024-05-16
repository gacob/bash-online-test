#!/bin/bash

first_turn() {
    current=$NCAT_REMOTE_ADDR
    current="${current//./}"

    echo Mía: $NCAT_REMOTE_ADDR
    echo Actual: $current

    if [[ "$current" -eq "$cliente_ip_1" ]]; then
        echo "Turno del Jugador 1"
        echo ¿Cuánto daño vas a hacer?
        read -r my_damage

        second_hp=$(( second_hp - my_damage ))
        echo Has hecho "$my_damage" > server_data
        echo "Al Jugador 2 le queda $second_hp" >> server_data
        my_damage=0
    else
        echo Es el turno del rival
    fi
}
