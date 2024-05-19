#!/usr/bin/env bash
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Karak Tmux Theme                                         +
# version    0.0.1                                                    +
# repository https://github.com/aamir-sultan/karak-tmux               +
# author     Aamir Sultan                                             +
# email      asultan.here@gmail.com                                   +
# ++++++++++++++++++++++++++++++++++++++++++++++++++default_pane_resize="5"

# tmux show-option "q" (quiet) flag does not set return value to 1, even though
# the option does not exist. This function patches that.
get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")
	if [ -z $option_value ]; then
		echo $default_value
	else
		echo $option_value
	fi
}

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
theme_variation=$(get_tmux_option "@theme_variation" "gruvbox-material-dark")
source "$CURRENT_DIR/src/styles/$theme_variation.tmux.conf"
