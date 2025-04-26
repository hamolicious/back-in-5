#!/usr/bin/env bash

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

center_text_block() {
  local term_width
  term_width=$(tput cols)
  while IFS= read -r line; do
    local line_length=${#line}
    if [ "$line_length" -ge "$term_width" ]; then
      echo "$line"
    else
      local padding=$(( (term_width - line_length) / 2 ))
      printf "%*s%s\n" "$padding" "" "$line"
    fi
  done
}

message_path=${BACK_IN_5_MESSAGE_SH:-"$PLUGIN_DIR/assets/default_message.sh"}
{
  source $message_path
} | center_text_block


art_path=${BACK_IN_5_ART_PATH:-"$PLUGIN_DIR/assets/ascii"}
icons=($(ls $art_path))
art_file="$art_path/${icons[RANDOM % ${#icons[@]}]}"

lines=$(cat "$art_file")
term_width=$(tput cols)
term_height=$(tput lines)
art_height=$(echo "$lines" | wc -l)
art_width=$(echo "$lines" | awk '{ print length }' | sort -nr | head -1)

top_padding=$(( (term_height - art_height) / 3 ))
left_padding=$(( (term_width - art_width) / 2 ))

printf "\n%.0s" $(seq 1 $top_padding)
while IFS= read -r line; do
  printf "%*s\n" $((left_padding + ${#line})) "$line"
done <<< "$lines"

read -n 1 -s

