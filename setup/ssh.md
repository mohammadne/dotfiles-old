# SSH configuration
- https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh

## Generating a new SSH key
- ssh-keygen -t ed25519 -C "your_email@example.com"

## Checking for existing SSH keys
- ls -al ~/.ssh

## Adding a new SSH key to your GitHub account
- sudo apt-get install xclip
- xclip -selection clipboard < ~/.ssh/id_ed25519.pub
- add it to your remote git server

## Testing your SSH connection
- ssh -T git@github.com
