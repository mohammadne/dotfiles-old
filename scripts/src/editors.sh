#!/bin/bash

function usage() {
	echo -n "installs editors"
}

function run() {
    local modules=(vim nvim)

    for module in "${modules[@]}"; do
        if yes_or_no "$module" "do you want to install $module?"; then "_$module"; fi
    done
}

function _vim() {
    require_pacman vim

    dotfile "vim" "vimrc"
}

function _nvim() {
    require_pacman neovim
}
