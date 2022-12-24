#!/bin/bash

function usage() {
	echo -n "installs terminal related stuffs"
}

function run() {
    local modules=(alacritty tmux zsh fish)

    for module in "${modules[@]}"; do
        if yes_or_no "$module" "do you want to install $module?"; then "_$module"; fi
    done
}

function _alacritty() {
    export dependencies=('rust')
    require_aur alacritty-git

    linker "alacritty" "$configs_dir/alacritty" "$HOME/.config/alacritty"
}

function _tmux() {
    require_pacman tmux tmuxp

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

function _zsh() {
    require_pacman zsh

    dotfile "zsh" "zshrc"
	dotfile "zsh" "zshenv"
	dotfile "zsh" "zsh.plug"

    if [ "$SHELL" != '/bin/zsh' ]; then
		message "general" "please change your shell to zsh manually"
	fi
}

function _fish() {
    require_pacman fish
}
