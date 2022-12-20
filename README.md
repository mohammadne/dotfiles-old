```
    ██████╗   ███████╗  ████████╗ ███████╗ ██╗ ██╗      ███████╗ ███████╗
    ██╔══██╗ ██╔════██╗ ╚══██╔══╝ ██╔════╝ ██║ ██║      ██╔════╝ ██╔════╝
    ██║  ██║ ██║    ██║    ██║    █████╗   ██║ ██║      █████╗   ███████╗
    ██║  ██║ ██║    ██║    ██║    ██╔══╝   ██║ ██║      ██╔══╝   ╚════██║
██╗ ██████╔╝ ╚███████╔╝    ██║    ██║      ██║ ███████╗ ███████╗ ███████║
╚═╝ ╚═════╝   ╚══════╝     ╚═╝    ╚═╝      ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝
```

![GitHub](https://img.shields.io/github/license/mohammadne/dotfiles?logo=gnu&style=flat-square)
[![Ansible](https://img.shields.io/badge/ansible-ready-black?logo=ansible&style=flat-square)](https://github.com/mohammadne-me/ansible-role)
![GitHub repo size](https://img.shields.io/github/repo-size/mohammadne/dotfiles?style=flat-square)

> This repository contains my personal configurations for Arch Linux (with sway window manager) and apple OSX.
>
> First, thank you for your visiting. A dotfiles repository is a personal repository, with it, you can manage your configuration between your systems, so I make this repository, a template repository, so you can easily start your personal one from it.
>
> if you this repository was helpful, please don't forget to support & star it.

## Installation

![Compatibility](https://img.shields.io/badge/works%20on-arch-blue?logo=archlinux&style=for-the-badge)
![Compatibility](https://img.shields.io/badge/works%20on-macos-white?logo=macos&style=for-the-badge)

1. create a basic directory structure and clone the dotfiles repository

    ``` bash
    mkdir -p "$HOME/Documents/Git" && cd "$HOME/Documents/Git"
    git clone https://github.com/mohammadne/dotfiles.git && cd ./dotfiles
    git remote set-url origin git@github.com:mohammadne/dotfiles.git
    ```

2. install & configure git credentials

3. configure ssh keys & config

4. install and configure appropriate tools

   - `cloner`: clones dotfiles repository in the place.

   - `install`: installs the dependencies needed in the dotfiles.

   - `linker`: create symlinks to the dotfile configs.

## Window Manager

I am using `sway` as my primary window manager. This repository structured around creating soft-links and because of that the configurations between these window managers are gathered in `sway/`.
