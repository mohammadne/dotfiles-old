#!/bin/bash

usage() {
	echo -n "installs required packages for having a working system"
}

install() {
	require_pacman neovim
}

config() {
	
}
