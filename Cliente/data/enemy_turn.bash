#!/bin/bash

second_hp=100

second_turn() {
    echo Turno del Jugador 2
    echo ¿Cuánto daño vas a hacer?
    read -r my_damage

    first_hp=$(( first_hp - my_damage ))
    echo "Al Jugador 1 le queda $first_hp"
    my_damage=0
}