# [TMUX](https://github.com/tmux/tmux/wiki/Installing)

## installation

1. install dependencies

    ``` bash
    # fedora
    sudo dnf install -y tmux

    # mac
    ```

2. install [tmux plugin manager](https://github.com/tmux-plugins/tpm)

    ``` bash
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    ```

3. symlink config files (directory)

    ``` bash
    ln -s ~/Develop/dotfiles/tmux ~/.config/tmux
    ```

## how to add a theme config

``` conf
background="" # background color
foreground="" # foreground color over background

edge_bg="" # edges background color
edge_fg="" # foreground color over edge_bg

hover_bg="" # hoverd & selected pane background color
hover_fg="" # foreground color over hover_bg

inactive="" # main inactive color
active="" # active color
```
