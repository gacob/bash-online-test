#!/bin/bash

source data/my_turn.bash
source data/enemy_turn.bash

inicio() {
    first_turn
    second_turn
}

nc 192.168.100.135 80
true=1



