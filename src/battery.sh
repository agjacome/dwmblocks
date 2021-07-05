#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r battery=$(cat /sys/class/power_supply/BAT0/capacity)

echo -n " ${battery}%"
