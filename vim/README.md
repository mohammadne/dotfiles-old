# VIM

## installation

1. install vim

    ``` bash
    sudo dnf install vim -y
    ```

2. install [vim-plug](https://github.com/junegunn/vim-plug)

    ``` bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

3. symlink vimrc

    ``` bash
    ln -s ~/Develop/dotfiles/vim/vimrc ~/.vimrc
    ```
