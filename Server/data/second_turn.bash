#!/bin/bash

second_turn() {
    current=$NCAT_REMOTE_ADDR
    current="${current//./}"
    combat=1
    my_damage=0
    
    rm ../combat_data
    touch ../combat_data
    echo $combat >> ../combat_data

    # Turno del Jugador 2
    if [[ "$current" -eq "$cliente_ip_1" ]]; then
        echo "Turno del Jugador 2"
        echo ¿Cuánto daño vas a hacer?
        read -r my_damage

        first_hp=$(( first_hp - my_damage ))
        echo Has hecho "$my_damage de daño" 
        echo "Al Jugador 1 le queda $first_hp de vida."

        echo $my_damage >> ../combat_data
        echo $first_hp >> ../combat_data
        my_damage=0
        combat=0
        echo $combat > $( sed -n 1p ../combat_data )
    # Espera de Jugador 2
    else
        echo Es el turno del rival

        # Obtener data del combate
        while [[ $combat -eq 1 ]]; do
            my_damage=$( sed -n 2p ../combat_data )
            first_hp=$( sed -n 3p ../combat_data )
            combat=$( sed -n 1p ../combat_data )

        done

        echo El enemigo te ha hecho "$my_damage" de daño.
        echo Te queda "$first_hp" de vida.
        rm ../combat_data
    fi
}
