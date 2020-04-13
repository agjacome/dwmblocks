#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -r update_count=$(checkupdates | wc -l)

echo -n "$update_count"
