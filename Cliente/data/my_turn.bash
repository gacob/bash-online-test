#!/bin/bash

first_hp=100

first_turn() {
    echo "Turno del Jugador 1"
    echo ¿Cuánto daño vas a hacer?
    read -r my_damage

    second_hp=$(( second_hp - my_damage ))
    echo "Al Jugador 2 le queda $second_hp"
    my_damage=0
}