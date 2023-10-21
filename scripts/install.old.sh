#!/bin/bash

# set -eu

dotfiles_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"

# source library files
for lib_file in "$dotfiles_directory/scripts/lib"/*; do source "$lib_file"; done

trap '_end' INT
function _end() {
	message "" "\nsee you in a better tomorrow"
	exit
}

message "pre" "home directory found at $HOME"
message "pre" "dotfiles found at $dotfiles_directory"

function _run() {
	files=($(list_directory_files $dotfiles_directory/scripts/src))
    files_option=$(convert_list_to_string_option $files)

    select_options SELECTED "$files_option"

	start=$(date +%s)

    for i in "${!SELECTED[@]}"; do
        if [ "${SELECTED[$i]}" == "true" ]; then
            source "$dotfiles_directory/scripts/src/${files[$i]}" 2>/dev/null || {
                message "${files[$i]}" "404 script not found"
                exit
            }

			if declare -f run > /dev/null; then
				run
			else
				msg "run function not found, there is nothing to do"
				exit
			fi
        fi
    done

	echo
	took=$(($(date +%s) - start))
	printf "done. it took %d seconds.\n" $took
}

_run "$@"
