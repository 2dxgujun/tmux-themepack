#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

theme_option="@theme"
themedir_option="@themedir"

default_theme='basic'

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -gqv "$option")"

  if [ -n "$option_value" ]; then
    echo "$option_value"
  else
    echo "$default_value"
  fi
}

main() {
  local theme="$(get_tmux_option "$theme_option" "$default_theme")"
  local themedir="$(get_tmux_option "$themedir_option" "$CURRENT_DIR")"

  if [ -f "$themedir/${theme}.tmuxtheme" ]; then
    tmux source-file "$theme_dir/${theme}.tmuxtheme"
  fi
}

main
