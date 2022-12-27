#!/bin/bash

function usage() {
	echo -n "installs terminal related stuffs"
}

function run() {
    local modules=(alacritty tmux zsh)

    for module in "${modules[@]}"; do
        if yes_or_no "$module" "do you want to install $module?"; then "_$module"; fi
    done
}

function _alacritty() {
    export dependencies=('rust')
    require_aur alacritty-git

    linker "alacritty" "$configs_dir/alacritty" "$HOME/.config/alacritty"
}

function _tmux() {
    require_pacman tmux tmuxp

	linker "tmux" "$configs_dir/tmux" "$HOME/.config/tmux"
	# linker "tmuxp" "$configs_dir/tmux" "$HOME/.config/tmuxp"
	# linker "tmuxs" "$configs_dir/tmux" "$HOME/.config/tmuxs"

	message "tmux" "installing tmux plugins"
	if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
		mkdir -p ~/.config/tmux/plugins
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	fi
	~/.config/tmux/plugins/tpm/bin/install_plugins
}

function _zsh() {
    require_pacman zsh

	mkdir -p ~/.config

    # TODO: complete it
    exit 1

    # dotfile "zsh" "zshrc"
	# dotfile "zsh" "zshenv"
	# dotfile "zsh" "zsh.plug"

    linker "zsh" "$configs_dir/zsh/zshrc" "$HOME/.zshrc"
    linker "zsh" "$configs_dir/zsh/p10k.zsh" "$HOME/.config/p10k.zsh"

    echo "Installing Oh My Zsh ..."
    backup "directory" ~/.config/oh-my-zsh
    ZSH="$HOME/.config/oh-my-zsh" sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 1>/dev/null

    echo "Installing Oh My Zsh plugins ..."
    local zsh_custom=${ZSH_CUSTOM:-$HOME/.config/oh-my-zsh/custom}
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $zsh_custom/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions "$zsh_custom/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$zsh_custom/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-history-substring-search "$zsh_custom/plugins/zsh-history-substring-search"
    git clone https://github.com/zsh-users/zsh-completions "$zsh_custom/plugins/zsh-completions"


    if [ "$SHELL" != '/bin/zsh' ]; then
		message "general" "please change your shell to zsh manually"
		# sudo usermod --shell "$(which zsh)" "$(whoami)"
	fi
}
