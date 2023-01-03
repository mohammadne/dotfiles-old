#!/bin/bash

# load color palette config
source ~/.tmux/themes/configs/"$1".conf

function set() {
   tmux set-option -gq "$1" "$2"
}

function setw() {
   tmux set-window-option -gq "$1" "$2"
}

# active left status style
set "status-left" "\
#[fg=$edge_fg,bg=$edge_bg,bold] #S \
#[fg=$edge_bg,bg=$background]"

# prefix highlight when pressed
set "@prefix_highlight_fg" "$edge_fg"
set "@prefix_highlight_bg" "$edge_bg"
set "@prefix_highlight_prefix_prompt" "prefix"
set "@prefix_highlight_empty_prompt" ""
set "@prefix_highlight_output_prefix" ""
set "@prefix_highlight_output_suffix" " |"

# active right status style
set "status-right" "\
#[fg=$edge_bg,bg=$background]
#{prefix_highlight}\
#[fg=$edge_fg,bg=$edge_bg,bold] #{USER} @ #h "

# inactive status windows style
set "window-status-format" "\
#[fg=$foreground,bg=$background] #F#I:#W "

# active status windows style
set "window-status-current-format" "\
#[fg=$hover_fg,bg=$hover_bg,nobold] #I:#W "
