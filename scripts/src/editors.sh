#!/bin/bash

function usage() {
	echo -n "installs editors"
}

function run() {
    local modules=(vim nvim)

    for module in "${modules[@]}"; do
        if yes_or_no "$module" "do you want to install $module?"; then "_$module"; fi
    done
}

function _vim() {
    require_pacman vim

    linker "vim" "$configs_dir/vim/vimrc" "$HOME/.vimrc"

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qa || echo "Something went wrong installing vim plugins."
}

function _nvim() {
    require_pacman neovim

    linker "vim" "$configs_dir/nvim" "$HOME/.config/nvim"

    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    nvim +PackerSync +qa || echo "Something went wrong installing nvim plugins."
}
