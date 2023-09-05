#!/bin/bash

function require_dnf() {
	if ! command -v dnf &> /dev/null; then
		msg "Linux with dnf is not installed, there is nothing to do"
		exit
	fi

	# Check if there are any package to install
    if [ $# -eq 0 ]; then exit; fi

	action "require" "dnf install $@"
	sudo dnf -y install "$@"
}

function require_go() {
	if ! command -v go &> /dev/null; then
		msg "Go is not installed, there is nothing to do"
		exit
	fi

	for pkg in "$@"; do
		action "require" "go $pkg"
		go install "$pkg@latest" 2>/dev/null
	done
}
