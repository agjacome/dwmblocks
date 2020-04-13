#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r cpu_usage=$(mpstat | grep 'all' | awk -F' ' '{ gsub(",", ".", $12); print 100 - $12 }')

echo -n "${cpu_usage}%"
