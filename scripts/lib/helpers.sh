#!/bin/bash

list_directory_files() {
	local directory="$1"

	# Check if the directory exists
	if [ -d "$directory" ]; then
		# Use 'find' to list files in the directory
		find "$directory" -type f -exec basename {} \; | tr '\n' ' '
	else
		echo "Directory not found: $directory"
	fi
}

convert_list_to_string_option() {
	local list="$1"
	local OPTION_STRING=""

	for i in "${!files[@]}"; do
		OPTION_STRING+="${files[$i]};"
	done

	echo $OPTION_STRING
}
