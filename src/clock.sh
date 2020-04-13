#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r datetime=$(date "+%a %d %b %H:%M:%S")

echo -n "${datetime}"
