#!/bin/bash

set -eu

dotfiles_path=$1

if ! command -v git &> /dev/null; then
    echo "Linux with git is not installed, there is nothing to do"
    exit 1
fi

mkdir -p $dotfiles_path && cd $dotfiles_path
git clone https://github.com/mohammadne/dotfiles.git && cd ./dotfiles
git remote set-url origin git@github.com:mohammadne/dotfiles.git
