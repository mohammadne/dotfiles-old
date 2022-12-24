#!/bin/bash

usage() {
	echo -n "installs fonts"
}

run() {
    msg "installing firacode-nerd"
    require_pacman ttf-firacode-nerd

    fc-cache -f ~/.local/share/fonts
}
