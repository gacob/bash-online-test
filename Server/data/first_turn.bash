#!/bin/bash

first_hp=100

first_turn() {
    player=$NCAT_REMOTE_ADDR
    echo Actual: $NCAT_REMOTE_ADDR
    if [[ $player -eq $cliente_ip_1 ]]; then
        echo "Turno del Jugador 1"
        echo ¿Cuánto daño vas a hacer?
        read -r my_damage

        second_hp=$(( second_hp - my_damage ))
        echo Has hecho "$my_damage" > server_data
        echo "Al Jugador 2 le queda $second_hp" > server_data
        my_damage=0
    else
        echo Es el turno del rival
    fi
}
