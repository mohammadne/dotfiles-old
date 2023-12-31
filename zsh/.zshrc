##############################################
# Tmux
##############################################

# When zsh is started attach to current tmux session or create a new one
if [ -z "$TMUX" ] 
then
    tmux new
fi

##############################################
# Neovim
##############################################

export EDITOR="nvim"
alias vim="nvim"

##############################################
# Oh-my-zsh
##############################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Show prefix before first line in prompt
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true 
ZSH_THEME="spaceship"

plugins=(
  git # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
  history-substring-search # ZSH port of Fish history search. Begin typing command, use up arrow to select previous use
  zsh-autosuggestions # Suggests commands based on your history
  zsh-completions # More completions
  zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
  colored-man-pages # Self-explanatory
)

# reload completions for zsh-completions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Colorize autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

export GOROOT=/usr/local/go
export GOPATH=$HOME/.config/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$HOME/.local/bin:$GOROOT/bin:$GOPATH:$GOBIN

alias zshconfig="nvim ~/.zshrc"
alias zshaliases="nvim ~/.zsh_aliases"
alias ohmyzsh="nvim ~/.oh-my-zsh"

alias sshkey="xclip -selection clipboard < ~/.ssh/id_ed25519.pub && echo 'SSH Public Key copied to clipboard'"

##############################################
# Spaceship-prompt
##############################################

# Spaceship-prompt customization
SPACESHIP_PROMPT_ORDER=(
dir             # Current directory section
user            # Username section
host            # Hostname section
git             # Git section (git_branch + git_status)
time          # Time stampts section
# hg            # Mercurial section (hg_branch  + hg_status)
# package       # Package version
# node          # Node.js section
# ruby          # Ruby section
# elixir        # Elixir section
# xcode         # Xcode section
# swift         # Swift section
# golang        # Go section
# php           # PHP section
# rust          # Rust section
# haskell       # Haskell Stack section
# julia         # Julia section
# docker        # Docker section
# aws           # Amazon Web Services section
# venv          # virtualenv section
# conda         # conda virtualenv section
# pyenv         # Pyenv section
# dotnet        # .NET section
# ember         # Ember.js section
# kubecontext   # Kubectl context section
exec_time       # Execution time
line_sep        # Line break
# battery         # Battery level and status
vi_mode         # Vi-mode indicator
jobs            # Background jobs indicator
# exit_code     # Exit code section
char            # Prompt character
)

SPACESHIP_DIR_PREFIX="%{$fg[blue]%}┌─[%b "
SPACESHIP_DIR_SUFFIX="%{$fg[blue]%} ] "
SPACESHIP_CHAR_SYMBOL="%{$fg[blue]%}└─▪%b "

##############################################
# Other
##############################################

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
