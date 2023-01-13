#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r layout=$(setxkbmap -query | awk -F":" '/layout/ { gsub(/ /, "", $2); print toupper($2) }')

echo -n $layout
