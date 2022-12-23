#!/bin/bash

usage() {
	echo -n "alacritty terminal with jetbrains mono font and configuration"
}

install() {
	require_pacman zsh
}

config() {
	dotfile "zsh" "zshrc"
	dotfile "zsh" "zshenv"
	dotfile "zsh" "zsh.plug"

	if [ "$SHELL" != '/bin/zsh' ]; then
		message "general" "please change your shell to zsh manually"
	fi
}
