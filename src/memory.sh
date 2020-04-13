#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r memory_usage=$(free -m | awk '/Mem/ { print $3 }')

echo -n "${memory_usage}MiB"
