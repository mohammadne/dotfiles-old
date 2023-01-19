#!/bin/bash

usage() {
	echo -n "installs base packages for having a working system"
}

packages=(
	git

	# ------------------------------------------------ editors

	bat # cat alternative
	exa # modern replacement for ls
	clipman # clipboard
	jq yq jless
	yamllint # linter for YAML files 
	glow # render markdown
	fzf # fuzzy finder 

	# ------------------------------------------------ system

	htop # process viewer
	dua-cli # Disk Usage Analyzer
	cpupower # processor power managment
	reflector # retrieve the latest mirror list from the Arch
	usbutils # USB utilities

	# ------------------------------------------------ networking

	curl # network data transfer utility
	mtr inetutils websocat fuse2
	aria2 # download manager
	bandwhich # bandwidth utilization tool
	speedtest-cli # speedtest cli
	openbsd-netcat
	# telnet tcpdump ss tshark wireshark 

	# ------------------------------------------------ utilities

	fd # new find
	jwt-cli # work with JSON Web Tokens
	tokei # statistics about your code
	pastel # generate, analyze, convert and manipulate colors
	man-pages man-db # manual page managment
)

run() {
	msg "installing ${packages[*]}"
	require_pacman "${packages[@]}"

	linker "git" "$configs_dir/git" "$HOME/.config/git"

	_ssh()

	linker "htop" "$configs_dir/htop/htoprc" "$HOME/.config/htop/htoprc"

	linker "aria2" "$configs_dir/aria2" "$HOME/.aria2"
}

function _ssh() {
	linker "ssh" "$configs_dir/ssh/config" "$HOME/.ssh/config"

	ed25519_path="$HOME/.ssh/id_ed25519"
	if [ ! -f "$ed25519_path" ]; then
		ssh-keygen -t ed25519 -C "$email" -f "$ed25519_path" -N "" &> /dev/null
	fi

	rsa_path="$HOME/.ssh/id_rsa"
	if [ ! -f "$rsa_path" ]; then
		ssh-keygen -t rsa -C "$email" -f "$rsa_path" -N "" &> /dev/null
	fi

	message "ssh" "add your public ssh credentials to remote hosts"
}
