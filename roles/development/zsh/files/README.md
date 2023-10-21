# ZSH

## installation

1. install dependencies

    ``` bash
    # fedora
    sudo dnf install -y zsh curl wget

    # mac
    ```

2. change default shell

    ``` bash
    # fedora
    sudo usermod --shell "$(which zsh)" "$(whoami)"

    # mac
    sudo dscl . -create /Users/$USER UserShell "$(which zsh)"
    ```

3. install [oh-my-zsh](https://ohmyz.sh/#install)

    ``` bash
    # create ~/.config directory to hold zsh's configurations.
    mkdir -p ~/.config

    # install via curl
    ZSH=~/.config/oh-my-zsh sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

4. install zsh-users custom plugins

    ``` bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM}/plugins/zsh-completions"
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM}/plugins/zsh-history-substring-search"
    ```

5. symlink config files

    ```bash
    ln -s ~/Develop/personal/dotfiles/configs/zsh/zshrc ~/.zshrc
    ln -s ~/Develop/personal/dotfiles/configs/zsh/zshenv ~/.zshenv
    ln -s ~/Develop/personal/dotfiles/configs/zsh/p10k.zsh ~/.config/p10k.zsh
    ```
