#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r battery=$(acpi -b | cut -d',' -f2 | tr -d ' ' | head -1)

echo -n " ${battery}"
