#!/usr/bin/env bash

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg-agent \
    software-properties-common -y

print_style "Upgrading packages" "info"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt update
sudo apt dist-upgrade -y

print_style "Installing packages" "info"
sudo apt install git git-flow fish code neovim docker-ce docker-ce-cli containerd.io docker-compose -y

print_style "Installing Nerd Fonts" "info"
mkdir -p ~/.fonts
ln -s fonts/NerdFonts ~/.fonts/
fc-cache -f -v
