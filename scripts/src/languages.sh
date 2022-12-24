#!/bin/bash

function usage() {
	echo -n "installs languages"
}

function run() {
    local languages=(go rust python node)

    for language in "${languages[@]}"; do
        if yes_or_no "$language" "do you want to install $language?"; then
            "_$language"
        fi
    done
}

function _go() {
    require_pacman go operator-sdk
    msg "$(go version)"

    msg "create go directories structure"
	local gopath
	gopath=$HOME/.cache/go
	[ -d "$gopath/pkg" ] || mkdir -p "$gopath/pkg"

    local gobin
	gobin=$HOME/.local/bin
	[ -d "$gobin" ] || mkdir -p "$gobin"

    msg "set go environments"
    go env -w GOPATH="$HOME/.cache/go"
	go env -w GOBIN="$HOME/.local/bin"
	go env -w GOPROXY="https://goproxy.io,goproxy.cn,direct"
	go env -w GONOSUMDB="gitlab.snapp.ir"
	go env -w GOPRIVATE="gitlab.snapp.ir"
	go env

    msg "fetch some good and useful go packages"
	require_go github.com/golangci/golangci-lint/cmd/golangci-lint
	require_go mvdan.cc/gofumpt
	require_go golang.org/x/tools/cmd/goimports
	require_go golang.org/x/tools/gopls
	require_go golang.org/dl/gotip
	require_go github.com/go-delve/delve/cmd/dlv
}

function _rust() {
    require_pacman rust

    mkdir -p "$HOME/.cargo" || true
    cp "$dotfiles_root/rust/config.toml" "$HOME/.cargo/config.toml"

    msg 'install cargo plugins'
	cargo install cargo-edit cargo-expand
}

function _python() {
    require_pacman python python-pip
    
    msg "update user-local version of pip"
	python -mpip install --user --pre -U pip

    local packages=(flake8 pep8-naming pipenv poetry hatch pdm black)
    for package in "${packages[@]}"; do
		if python -mpip install --user --pre -U "$package"; then
			msg "$package installation succeeded"
		else
			msg "$package installation failed"
		fi
	done
}

function _node() {
    require_pacman nodejs npm
    msg "$(node -v)"
}
