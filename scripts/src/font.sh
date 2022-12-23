#!/bin/bash

usage() {
	echo -n "installs fonts"
}

install() {
    msg "installing firacode-nerd"
    require_pacman ttf-firacode-nerd
}

config() {
    fc-cache -f ~/.local/share/fonts
}
