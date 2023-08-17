#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r mpd=$(mpc current -f '%artist% – %title%' 2> /dev/null)
declare -r spoty=$(spmd -P '[paused]' -S 'off' '%artist – %title' 2> /dev/null)

declare -r song=${mpd:-$spoty}

[[ -z $song || $song == "off" ]] && echo -n "off" || echo -n "${song}";
