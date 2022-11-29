```
    ██████╗   ███████╗  ████████╗ ███████╗ ██╗ ██╗      ███████╗ ███████╗
    ██╔══██╗ ██╔════██╗ ╚══██╔══╝ ██╔════╝ ██║ ██║      ██╔════╝ ██╔════╝
    ██║  ██║ ██║    ██║    ██║    █████╗   ██║ ██║      █████╗   ███████╗
    ██║  ██║ ██║    ██║    ██║    ██╔══╝   ██║ ██║      ██╔══╝   ╚════██║
██╗ ██████╔╝ ╚███████╔╝    ██║    ██║      ██║ ███████╗ ███████╗ ███████║
╚═╝ ╚═════╝   ╚══════╝     ╚═╝    ╚═╝      ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝
```

> personal dotfiles configuration files.
>
> for more detailed instruction on how to install and customize each tool, checkout its readme file. there is detailed instruction there.
>
> if you this repository was helpful, please don't forget to support & star it.

## Supported Platforms

> I'm working with this 2 platform, so the configurations are tested on both of them, but if you are using other platforms, it's appriciated to open a [pull request](https://github.com/mohammadne/dotfiles/pulls).

- Fedora 💚

- MacOS

## installation

1. clone the repository

    ``` bash
    # use this hack in order to get the repository without pre ssh-credentials
    cd ~/Develop && git clone https://github.com/mohammadne/dotfiles.git
    git remote set-url origin git@github.com:mohammadne/dotfiles.git
    ```

2. install & configure git credentials

3. configure ssh keys & config

4. install and configure appropriate tools

   - `cloner`: clones dotfiles repository in the place.

   - `install`: installs the dependencies needed in the dotfiles.

   - `linker`: create symlinks to the dotfile configs.
