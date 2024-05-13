#!/bin/bash

# Definir variables
puerto=8080 # Puerto para el servidor
jugadores=( ) # Lista de jugadores conectados
puntuaciones=(0 0) # Puntuaciones de los jugadores (índice 0: jugador 1, índice 1: jugador 2)

# Función para manejar la conexión de un jugador
function manejar_jugador() {
  # Obtener el socket del jugador
  socket=<span class="math-inline">1
\# Bucle de juego
while true; do
\# Recibir la jugada del jugador
jugada\=(nc -l $socket | tr [:upper:] [:lower:])

    # Validar la jugada
    if [[ ! <span class="math-inline">jugada \=\~ ^\(piedra\|papel\|tijera\)</span> ]]; then
      echo "Jugada inválida: $jugada" >&<span class="math-inline">socket
continue
fi
\# Buscar al oponente
oponente\_index\=((1 - $(echo "$jugadores" | index "<span class="math-inline">socket"\)\)\)
oponente\_socket\={jugadores[$oponente_index]}

    # Si no hay oponente, esperar
    if [[ -z $oponente_socket ]]; then
      echo "Esperando a otro jugador..." >&<span class="math-inline">socket
continue
fi
\# Determinar el ganador
ganador\=(determinar_ganador $jugada $(nc -l $oponente_socket))

    # Enviar el resultado al jugador
    if [[ $ganador == 0 ]]; then
      echo "Empate!" >&$socket
    elif [[ $ganador == 1 ]]; then
      echo "Ganaste!" >&$socket
      ((puntuaciones[0]++))
    else
      echo "Perdiste!" >&$socket
      ((puntuaciones[1]++))
    fi

    # Enviar el resultado al oponente
    echo "Tu oponente ha elegido $(nc -l $oponente_socket)" >&$socket
    if [[ $ganador == 0 ]]; then
      echo "Empate!" >&$oponente_socket
    elif [[ $ganador == 1 ]]; then
      echo "Perdiste!" >&$oponente_socket
      ((puntuaciones[1]++))
    else
      echo "Ganaste!" >&$oponente_socket
      ((puntuaciones[0]++))
    fi

    # Preguntar si quieren jugar otra partida
    echo "¿Quieres jugar otra partida? (sí/no)" >&<span class="math-inline">socket
respuesta\=</span>(nc -l $socket)

    if [[ $respuesta != "sí" ]]; then
      break
    fi
  done

  # Desconectar al jugador
  nc -u <span class="math-inline">socket \>& /dev/null
echo "Jugador desconectado"
jugadores\=\("</span>{jugadores[@]}") # Eliminar al jugador de la lista
}

# Función para determinar el ganador
function determinar_ganador() {
  jugada1=$1
  jugada2=$2

  if [[ $jugada1 == $jugada2 ]]; then
    return 0 # Empate
  elif [[ $jugada1 == "piedra" && $jugada2 == "tijera" ]]; then
    return 1 # Jugador 1 gana
  elif [[ $jugada1 == "papel" && $jugada2 == "piedra" ]]; then
    return 1

