# [NeoVIM](https://github.com/neovim/neovim/wiki/Installing-Neovim)

> my fully fledged neovim connfigurtions.

## installation

1. install neovim

    ``` bash
    # Fedora
    sudo dnf install -y neovim python3-neovim

    # MacOS
    brew install neovim
    ```

2. install [packer](https://github.com/wbthomason/packer.nvim) as the package manager

    ``` bash
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # install nvim plugins.
    nvim +PackerSync +qa
    ```

3. symlink neovim configuraton (directory)

    ``` bash
    ln -s ~/Develop/dotfiles/nvim ~/.config/nvim
    ```
