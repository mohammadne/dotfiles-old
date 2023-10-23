# Dotfiles

```txt
██████╗   ███████╗  ████████╗ ███████╗ ██╗ ██╗      ███████╗ ███████╗
██╔══██╗ ██╔════██╗ ╚══██╔══╝ ██╔════╝ ██║ ██║      ██╔════╝ ██╔════╝
██║  ██║ ██║    ██║    ██║    █████╗   ██║ ██║      █████╗   ███████╗
██║  ██║ ██║    ██║    ██║    ██╔══╝   ██║ ██║      ██╔══╝   ╚════██║
██████╔╝ ╚███████╔╝    ██║    ██║      ██║ ███████╗ ███████╗ ███████║
╚═════╝   ╚══════╝     ╚═╝    ╚═╝      ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝
```

> Configuration files and tools for configuring rich systems.
>
> for more detailed instruction on how to install and customize each tool, checkout its readme file. there is detailed instruction there.
>
> if you this repository was helpful, please don't forget to support & star it.

## Installation

![Ubuntu Compatibility](https://img.shields.io/badge/works%20on-ubuntu-white?logo=ubuntu&style=for-the-badge)

> **_NOTE:_** I'm using Ubuntu as my personal OS (latest version for my desktop and latest LTS version for my server) and this dotfile is written and tested based on it.

``` bash
# Specify dotfiles destination (change it according to your preferred choice)
dotfiles_path=$HOME/Develop/personal

# Clone
curl -Ls https://raw.githubusercontent.com/mohammadne/dotfiles/main/scripts/clone.sh | bash -s $dotfiles_path

# Install
$dotfiles_path/dotfiles/scripts/install.sh
```
