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

![Fedora Compatibility](https://img.shields.io/badge/works%20on-fedora-white?logo=fedora&style=for-the-badge)
![Ubuntu Compatibility](https://img.shields.io/badge/works%20on-ubuntu-white?logo=ubuntu&style=for-the-badge)

> **_NOTE:_** I'm actively working with `Fedora` as my preferred personal OS and `Ubuntu` as my server choice, so the configurations are written and tested based on it, but I'm open to accept to support for other platforms if you need, please open a [pull request](https://github.com/mohammadne/dotfiles/pulls) based on your prefered platform of choice.

``` bash
# Clone the dotfiles in the destination you want
path=$HOME/Develop/personal
wget -O - https://raw.githubusercontent.com/mohammadne/dotfiles/main/scripts/clone $path | bash
$path/dotfiles/scripts/install.sh
```
