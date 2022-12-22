#!/bin/bash

usage() {
	echo -n "installs required packages for having a working system"
}

packages=(
	# ------------------------------------------------ editors
	bat # cat alternative
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
	require_pacman "${packages[@]}"
}
