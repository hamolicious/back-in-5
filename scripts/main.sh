#!/usr/bin/env bash

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

{
  echo ""
  echo "☕ Coffee break"
  echo ""
  echo "🕔 Started at: $(date "+%H:%M")"
  echo ""
  echo "🏃 Back Shortly"
} | center_text_block


art_path="$PLUGIN_DIR/scripts/assets"
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

