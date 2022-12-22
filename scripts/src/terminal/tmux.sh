#!/bin/bash

usage() {
	echo -n "alacritty terminal with jetbrains mono font and configuration"
}

install() {
	require_pacman tmux tmuxp
}

config() {
	configfile alacritty
}
