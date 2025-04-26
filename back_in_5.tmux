#!/usr/bin/env bash

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux bind ${BACK_IN_5_LAUNCH_KEY:-"b"} display-popup -E -B -w 100% -h 100% -x 0% -y 0% "$PLUGIN_DIR/scripts/main.sh"

