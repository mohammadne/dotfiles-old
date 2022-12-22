#!/bin/bash

set -eu

# -------------------------------------------------------------------------------> Variables

program_name=$0

# a global variable that points to dotfiles root directory, used also in scripts.
dotfiles_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# -------------------------------------------------------------------------------> Traps

trap '_error' ERR

trap '_end' INT

_end() {
	echo "see you in a better tomorrow [you signal start.sh execuation]"
	exit
}

_error() {
	echo "some errors have been occured during execution, exiting right now ..."
	exit
}

# -------------------------------------------------------------------------------> Traps

_usage() {
	echo ""
	echo "usage: $program_name [-y] [-h] [-f] script [script options]"
	echo "  -f   force"
	echo "  -h   display help"
	echo "  -d   as dependency (internal usage)"
	echo "  -y   yes to all"
	echo ""
}



_main "$@"