#!/bin/bash

dotfiles_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"

if ! command -v ansible &> /dev/null; then
    echo "Linux with ansible is not installed, there is nothing to do"
    exit 1
fi

function run_play() {
    ansible-playbook $dotfiles_directory/playbook.yaml \
        -i $dotfiles_directory/inventory.ini \
        -e "dotfiles_directory=$dotfiles_directory" \
        --tags $1
}

run_play "general,git"

