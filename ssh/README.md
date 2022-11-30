# SSH

> a good document is [github ssh reference](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

## configuration

1. install dependencies

    ``` bash
    sudo dnf install xclip -y
    ```

2. generate SSH key for each account

    ``` bash
    cd ~/.ssh # change working directory

    # generate key-pairs
    # the key-generator prompts for a file name, enter the `id_ed25519` and `id_ed25519_snapp` respectively.
    ssh-keygen -t ed25519 -C "mohammadne.dev@gmail.com"
    ssh-keygen -t ed25519 -C "mohammad.nasresfahani@snapp.cab"
    ```

3. symlink config file

    ``` bash
    ln -s ~/Develop/dotfiles/ssh/config ~/.ssh/config
    ```
