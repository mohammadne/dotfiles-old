#!/bin/bash

usage() {
	echo -n "installs vim text editor"
}

install() {
	require_pacman vim
}

config() {
	dotfile "vim" "vimrc"
}
