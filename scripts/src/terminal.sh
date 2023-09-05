#!/bin/bash

function run() {
	message "terminal" "Installs terminal related stuff"

    local modules=(alacritty tmux zsh font)


    # for module in "${modules[@]}"; do
    #     if yes_or_no "$module" "do you want to install $module?"; then "_$module"; fi
    # done
}

function _alacritty() {
    require_dnf alacritty

    linker "alacritty" "$configs_dir/alacritty.yml" "$HOME/.config/alacritty.yml"
}

function _tmux() {
    require_dnf tmux tmuxp

	linker "tmux" "$configs_dir/tmux" "$HOME/.config/tmux"

	message "tmux" "installing tmux plugins"
    tpm_path="$HOME/.local/share/tmux/plugins/tpm"
	if [ ! -d "$tpm_path" ]; then
		git clone https://github.com/tmux-plugins/tpm "$tpm_path"
	fi
	"$tpm_path/bin/install_plugins"

	# linker "tmuxp" "$configs_dir/tmux" "$HOME/.config/tmuxp"
	# linker "tmuxs" "$configs_dir/tmux" "$HOME/.config/tmuxs"
}

function _zsh() {
    require_dnf zsh

	mkdir -p ~/.config

    # TODO: complete it
    exit 1

    # change default shell
    sudo usermod --shell "$(which zsh)" "$(whoami)"

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

function _font() {
    font_family="FiraCode"
    font_weights="Bold SemiBold Medium Regular Light"

    font_repository="https://github.com/ryanoasis/nerd-fonts"
    font_repository_release="v2.1.0"

    font_home="~/.local/share/fonts/$font_family"
    mkdir -p $font_home && cd $font_home

    echo "Installing "$font_family" fonts ..."
    for weight in $font_weights; do
        curl -fLo "$weight.ttf" "$font_repository/blob/$font_repository_release/patched-fonts/$font_family/$weight/complete/Fira%20Code%20$weight%20Nerd%20Font%20Complete.ttf"
    done

    # reset font cache
    if (command -v fc-cache &> /dev/null) ; then
        echo "Resetting font cache ..."
        fc-cache -f "$font_home"
    fi
}
