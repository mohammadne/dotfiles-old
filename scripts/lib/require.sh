#!/bin/bash

function require_pacman() {
	if ! command -v pacman &> /dev/null; then
		msg " linux with pacman is not installed, there is nothing to do"
		exit
	fi

	for pkg in "$@"; do
		running "require" " pacman $pkg"
		if ! pacman -Qi "$pkg" >/dev/null 2>&1; then
			action "require" "勒pacman -Sy $pkg"
			sudo pacman -Sy --noconfirm "$pkg"
		fi
	done
}

function require_aur() {
	for pkg in "$@"; do
		running "require" " arch users repository $pkg"
		if (! pacman -Qi "$pkg" >/dev/null 2>&1); then
			action "require" "勒yay -Sy $pkg"
			yay -Sy --sudoloop --noconfirm "$pkg"
		elif [[ "$pkg" =~ .*-git ]]; then
			action "require" " yay -Sy $pkg to upgrade -git package"
			yay -Sy --sudoloop --noconfirm "$pkg" || true
		fi
	done
}

function require_mason() {
	for pkg in "$@"; do
		action "require" " neovim + mason $pkg"
		nvim "+MasonInstall $pkg" --headless +qall 2>/dev/null
	done
}

function require_go() {
	for pkg in "$@"; do
		action "require" "ﳑ go $pkg"
		go install "$pkg@latest" 2>/dev/null
	done
}
