#!/usr/bin/env bash

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

command-alias -a back-in-5='display-popup -E -B -w 100% -h 100% -x 0% -y 0% "$PLUGIN_DIR/scripts/main.sh"'
bind b display-popup -E -B -w 100% -h 100% -x 0% -y 0% "$PLUGIN_DIR/scripts/main.sh"

