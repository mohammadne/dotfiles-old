#!/bin/bash

usage() {
	echo -n "tmux & tmuxp configuration"
}

install() {
	require_pacman tmux tmuxp
}

config() {
	configfile alacritty
}
