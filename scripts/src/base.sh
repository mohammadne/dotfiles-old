#!/bin/bash

usage() {
	echo -n "installs base packages for having a working system"
}

packages=(
	git

	# ------------------------------------------------ editors

	bat # cat alternative
	clipman # clipboard
	jq yq jless
	yamllint # linter for YAML files 
	glow # render markdown
	fzf # fuzzy finder 

	# ------------------------------------------------ system

	htop
	dua-cli # Disk Usage Analyzer
	cpupower
	reflector # retrieve the latest mirror list from the Arch

	# ------------------------------------------------ networking

	curl
	mtr inetutils websocat fuse2
	aria2 # download utility
	bandwhich # bandwidth utilization tool
	speedtest-cli
	# gnu-netcat telnet tcpdump ss tshark wireshark 

	# ------------------------------------------------ utilities

	fd # new find
	jwt-cli # work with JSON Web Tokens
	tokei # statistics about your code
	wakatime # metrics about your programming
	pastel # generate, analyze, convert and manipulate colors

	man-pages usbutils exfat-utils
	openbsd-netcat
	man-db
)

install() {
	msg "installing ${packages[*]}"
	# require_pacman "${packages[@]}"
}

config() {
	linker "git" "$configs_dir/git" "$HOME/.config/git"

	linker "ssh" "$configs_dir/ssh/config" "$HOME/.ssh/config"
	if [ ! -f "$HOME/.ssh/id_ed25519" ]; then 
		ssh-keygen -t ed25519 -C "mohammadne.dev@gmail.com" -f "$HOME/.ssh/id_ed25519" -N "" &> /dev/null
	fi
	if [ ! -f "$HOME/.ssh/id_ed25519_snapp" ]; then 
		ssh-keygen -t ed25519 -C "mohammad.nasresfahani@snapp.cab" -f "$HOME/.ssh/id_ed25519_snapp" -N "" &> /dev/null
	fi

	exit

	dotfile "conf" "dircolors"
	dotfile "conf" "aria2"
	configfile "htop" "" "conf"

	dotfile "bin" "bin" false

	mkdir "$HOME/.wakatime" || true
	dotfile "wakatime" "wakatime.cfg"
}
