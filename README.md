# Dotfiles

```txt
██████╗   ███████╗  ████████╗ ███████╗ ██╗ ██╗      ███████╗ ███████╗
██╔══██╗ ██╔════██╗ ╚══██╔══╝ ██╔════╝ ██║ ██║      ██╔════╝ ██╔════╝
██║  ██║ ██║    ██║    ██║    █████╗   ██║ ██║      █████╗   ███████╗
██║  ██║ ██║    ██║    ██║    ██╔══╝   ██║ ██║      ██╔══╝   ╚════██║
██████╔╝ ╚███████╔╝    ██║    ██║      ██║ ███████╗ ███████╗ ███████║
╚═════╝   ╚══════╝     ╚═╝    ╚═╝      ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝
```

> personal dotfiles configuration files.
>
> for more detailed instruction on how to install and customize each tool, checkout its readme file. there is detailed instruction there.
>
> if you this repository was helpful, please don't forget to support & star it.

## Installation

> **_NOTE:_** I'm actively working with `Fedora Linux`, so the configurations are written and tested based on it, but I'm open to accept to support for other platforms if you need, please open a [pull request](https://github.com/mohammadne/dotfiles/pulls) based on your prefered platform of choice.

1. Create a basic directory structure and clone the dotfiles repository

    ``` bash
    # I personally prefer to put my dotfiles at ~/Develop/personal but you can put it anywhere you want
    mkdir -p "$HOME/Develop/personal" && cd "$HOME/Develop/personal"
    git clone https://github.com/mohammadne/dotfiles.git && cd ./dotfiles
    git remote set-url origin git@github.com:mohammadne/dotfiles.git
    ```

2. Install and configure packages

    ```bash
    # base packages for having a working system
    ./scripts/install.sh base

    # other tools based on your needs
    ./scripts/install.sh <script>
    ```
