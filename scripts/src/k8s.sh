#!/bin/bash

usage() {
	echo -n "installs kubernetes tools"
}

run() {
    require_pacman argocd kubectx stern
    require_aur kubeval-bin okd-client-bin kube-score-bin
}

# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
function _kubectl() {
    require_pacman kubectl
}

function _helm() {
    require_pacman helm

    msg "awesome chart repositories for helm"
    helm repo add bitnami https://charts.bitnami.com/bitnami || true
    helm repo update
}

# https://console.redhat.com/openshift/downloads
function _oc() {
    wget https://github.com/okd-project/okd/releases/download/4.11.0-0.okd-2022-08-20-022919/openshift-client-linux-4.11.0-0.okd-2022-08-20-022919.tar.gz
    tar -xvf openshift-client-linux-4.11.0-0.okd-2022-08-20-022919.tar.gz
    sudo mv oc /usr/local/bin/
    oc version
}

# telepresence
# helmsman
# kustomize
# helm
# kind
# vagrant
# terraform
# ansible
# operator-sdk
# sops
# vault
# 
