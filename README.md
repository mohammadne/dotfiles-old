# Dotfiles

## Installation

1. create a basic directory structure and clone the dotfiles repository

    ``` bash
    mkdir -p "$HOME/Documents/Git" && cd "$HOME/Documents/Git"
    git clone https://github.com/mohammadne/dotfiles.git && cd ./dotfiles
    git remote set-url origin git@github.com:mohammadne/dotfiles.git
    ```

2. install and configure packages

    ```bash
    # base packages for having a working system
    ./scripts/install.sh base

    # other tools based on your needs
    ./scripts/install.sh <script>
    ```
