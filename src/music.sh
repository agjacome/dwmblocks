#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r mpd=$(mpc current -f '%artist% – %title%' 2> /dev/null)
declare -r spoty=$(spotify-now -i '%artist – %title' -e 'off' -p 'off' 2> /dev/null)

declare -r song=${mpd:-$spoty}

[[ -z $song || $song == "off" ]] && echo -n "off" || echo -n "${song}";
