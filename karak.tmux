#!/usr/bin/env bash
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# title      Karak Tmux Theme                                         +
# version    0.0.1                                                    +
# repository https://github.com/aamir-sultan/karak-tmux               +
# author     Aamir Sultan                                             +
# email      asultan.here@gmail.com                                   +
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

theme_variation=$(get_tmux_option "@theme_variation" "night")

# shellcheck source=src/palletes/night.sh
. "$CURRENT_DIR/palletes/$theme_variation.sh"

### Load Options
border_style_active_pane=$(get_tmux_option "@theme_active_pane_border_style" "fg=${PALLETE['dark5']}")
border_style_inactive_pane=$(get_tmux_option "@theme_inactive_pane_border_style" "fg=${PALLETE[bg_highlight]}")
left_separator=$(get_tmux_option "@theme_left_separator" "")
right_separator=$(get_tmux_option "@theme_right_separator" "")


tmux set -g status-style bg=#1A1B26
tmux set -g status-right-length 150

SCRIPTS_PATH="$CURRENT_DIR/src"

cmus_status="#($SCRIPTS_PATH/cmus-tmux-statusbar.sh)"
git_status="#($SCRIPTS_PATH/git-status.sh #{pane_current_path})"
custom_number="#($SCRIPTS_PATH/custom-number.sh #{window_index} -d)"
custom_pane="#($SCRIPTS_PATH/custom-number.sh #P -O)"

# fg_color="#15161e"
# bg_color="#93c47d"

# fg_color="#15161e"
# bg_color="#2b97fa"

fg_color="#15161e"
bg_color="#f59c4f"

# win_symbol_color="#15161e"
# win_symbol_color="#71c461"
win_symbol_color=$bg_color
# win_symbol_color="yellow"

win_symbol=""
# win_symbol=" "
# win_symbol=" "
# win_symbol=""

last_win_symbol="•"
# last_win_symbol="󰁯"

#+--- Bars LEFT ---+
# Session name
tmux set -g status-left "#[fg=$fg_color,bg=$bg_color,bold] #S #[fg=#2b97fa,bg=default,nobold,noitalics,nounderscore]"

#+--- Windows ---+
# Focus
# tmux set -g window-status-current-format "#[fg=#44dfaf,bg=#1F2335] $win_symbol #[fg=#a9b1d6,bg=#1F2335]$custom_number #[bold,nodim]#W#[nobold,dim]#{?pane_index, $custom_pane,} #{?window_last_flag,,} "
tmux set -g window-status-current-format "#[fg=$win_symbol_color, bg=$fg_color] $win_symbol #[noblink]#[fg=#aaaaac,bg=#1F2335]$custom_number #[bold,nodim]#W#[nobold,dim]#{?pane_index, $custom_pane,} #{?window_last_flag,,} "
# Unfocused
tmux set -g window-status-format "#[fg=#717274,bg=default,none,dim] $custom_number #W#[nobold,dim]#{?pane_index, $custom_pane,}#[fg=yellow,blink] #{?window_last_flag,$last_win_symbol,} "

#+--- Bars RIGHT ---+
# tmux set -g status-right "$cmus_status#[fg=#a9b1d6,bg=#24283B]  %Y-%m-%d #[]❬ %H:%M $git_status"
tmux set -g status-right "$cmus_status#[fg=$fg_color,bg=$bg_color,bold]  %Y-%m-%d #[]❬ %H:%M"
tmux set -g window-status-separator ""
