#!/bin/bash

set -eu

# -------------------------------------------------------------------------------> common

program_name=$0

# a global variable that points to dotfiles root directory, used also in scripts.
dotfiles_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$dotfiles_root/lib/header.sh"
source "$dotfiles_root/lib/message.sh"
source "$dotfiles_root/lib/linker.sh"

message "pre" "home directory found at $HOME"
message "pre" "dotfiles found at $dotfiles_root"

trap '_end' INT

_end() {
	echo "see you in a better tomorrow [you signal start.sh execuation]"
	exit
}

# -------------------------------------------------------------------------------> functions

_usage() {
	echo ""
	echo "usage: $program_name [-y] [-h] [-f] script [script options]"
	echo "  -f   force"
	echo "  -h   display help"
	echo "  -d   as dependency (internal usage)"
	echo "  -y   yes to all"
	echo ""
}

_install() {
	if ! command -v pacman &> /dev/null; then
		msg " linux with pacman is not installed, there is nothing to do"
		exit
	fi

	if declare -f install > /dev/null; then
		install
	else
		msg "install not found, there is nothing to do"
		exit
	fi

	return
}

_config() {
	if declare -f config >/dev/null; then
		config "$@"
	fi
}

_run() {
	# global variable indicates force in specific script and runs script with root
	local force=false

	# global variable indicates show help for user in specific script
	# there is no need to use it in your script
	local show_help=false

	# ask no questions, use sane defaults
	local yes_to_all=false

	# as_dependency shows that this start.sh is going to install a dependency
	local as_dependency=false

	# parses options flags
	while getopts 'fdhy' argv; do
		case $argv in
		h)
			show_help=true ;;
		f)
			force=true ;;
		d)
			as_dependency=true ;;
		y)
			yes_to_all=true ;;
		*)
			_usage ;;
		esac
	done

	# gives the position of the next command line argument
	for ((i = 2; i <= OPTIND; i++)); do
		shift
	done

	if [ $as_dependency = false ]; then
		source "$dotfiles_root/scripts/lib/header.sh"
	fi

	# handles root user
	if [[ $EUID -eq 0 ]]; then
		message "pre" "it must run without the root permissions with a regular user."
		if [ $force = false ]; then exit 1; fi
	fi

	# handles given script run and result
	local script start took

	# print usage if no parameters given
	if [ -z "$1" ]; then _usage; exit 1; fi

	script=$1
	shift

	start=$(date +%s)

	# shellcheck disable=1090
	source "$dotfiles_root/scripts/$script.sh" 2>/dev/null || {
		echo "404 script not found"
		exit
	}

	if [ $show_help = true ]; then
		_usage
		echo
		usage
	else
		# run the script
		msg() { message "$script" "$@"; }
		msg "$(usage)"

		# handle dependencies by executing the start.sh for each of them separately
		dependencies=${dependencies:-""}
		_dependencies "${dependencies[@]}"

		_install "$@"
		_config "$@"

		# handle additional packages by executing the start.sh for each of them separately
		additionals=${additionals:-""}
		_additionals "${additionals[@]}"
	fi

	echo
	took=$(($(date +%s) - start))
	printf "done. it took %d seconds.\n" $took
}

_run "$@"
