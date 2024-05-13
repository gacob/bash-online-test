#!/bin/bash


# Definir variables
puerto=80 # Puerto para el servidor
jugadores=( ) # Lista de jugadores conectados
puntuaciones=(0 0) # Puntuaciones de los jugadores (índice 0: jugador 1, índice 1: jugador 2)
count=0
max=0

PORT=3000
IP=192.168.2.174
# echo PONG | nc -ns 192.168.2.174 3000
# nc -l -p $PORT -s $IP -k
#nc -lNk localhost 8080
nc -lvNk 192.168.2.174 3000

