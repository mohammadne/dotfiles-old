#!/bin/bash

usage() {
	echo -n "tmux & tmuxp configuration"
}

install() {
	require_pacman tmux tmuxp
}
 
config() {
	ln -s ~/Develop/dotfiles/tmux ~/.config/tmux

	message "tmux" "installing tmux plugins"
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	~/.config/tmux/plugins/tpm/bin/install_plugins
}
 