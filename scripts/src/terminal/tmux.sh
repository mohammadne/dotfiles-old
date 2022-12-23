#!/bin/bash

usage() {
	echo -n "tmux & tmuxp configuration"
}

install() {
	require_pacman tmux tmuxp
}
 
config() {
	dotfile "tmux" "tmux.conf"
	configfile "tmuxs" "" "tmux"
	configfile "tmuxp" "" "tmux"

	message "tmux" "installing tmux plugins"
	if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
		mkdir -p ~/.tmux/plugins
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
	~/.tmux/plugins/tpm/bin/install_plugins
}
 