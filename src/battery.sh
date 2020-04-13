#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

local -r battery=$(acpi -b | cut -d',' -f2 | tr -d ' ')

echo -n "${battery}"
