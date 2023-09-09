#!/bin/bash

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
	telnet
	tcpdump
	ss
	tshark
	wireshark

	# ------------------------------------------------ utilities

	fd # new find
	jwt-cli # work with JSON Web Tokens
	tokei # statistics about your code
	pastel # generate, analyze, convert and manipulate colors
	man-pages man-db # manual page managment
)

run() {
	message "base" "Installs base packages for having a working system"

	# message "installing ${packages[*]}"
	# require_dnf "${packages[@]}"

	linker "git" "$dotfiles_directory/git" "$HOME/.config/git"
	linker "htop" "$dotfiles_directory/htop/htoprc" "$HOME/.config/htop/htoprc"
	linker "aria2" "$dotfiles_directory/aria2" "$HOME/.aria2"

	# _ssh_keys()
}

function _ssh_keys() {
	linker "ssh" "$dotfiles_directory/ssh" "$HOME/.ssh"

	# Use awk to extract and print unique IdentityFiles
	identity_files=($(awk '$1 == "IdentityFile" {print $2}' "$ssh_config_file" | sort -u))

	# Check if there are any IdentityFiles found
	if [ ${#identity_files[@]} -eq 0 ]; then
		echo "No IdentityFiles found in the SSH config file."
	fi

	for i in "${!identity_files[@]}"; do
		filename=$(basename "${identity_files[$i]}")
		algorithm="${filename##*_}"

		if [ ! -f "$path" ]; then
			ssh-keygen -t "$algorithm" -f "$HOME/.ssh/$filename" -N "" -C ""
		fi
	done

	message "ssh" "add your public ssh credentials to remote hosts"
}
