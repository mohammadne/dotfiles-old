#!/bin/bash

dotfiles_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
echo $dotfiles_directory

if ! command -v ansible &> /dev/null; then
    echo "Linux with ansible is not installed, there is nothing to do"
    exit 1
fi

