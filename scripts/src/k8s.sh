#!/bin/bash

usage() {
	echo -n "installs kubernetes"
}

run() {
    require_pacman kubectl helm argocd kubectx stern
    require_aur kubeval-bin okd-client-bin kube-score-bin

    msg "awesome chart repositories for helm"
    helm repo add bitnami https://charts.bitnami.com/bitnami || true
    helm repo update
}
