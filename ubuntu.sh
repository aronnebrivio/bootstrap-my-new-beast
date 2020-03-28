#!/usr/bin/env bash

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg-agent \
    software-properties-common \
    build-essential -y

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

sudo systemctl start docker
sudo systemctl enable docker

print_style "Installing Ruby and rbenv" "info"
rm -rf ~/.rbenv
rm ~/.bashrc
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

print_style "Installing Nerd Fonts" "info"
mkdir -p ~/.fonts
ln -s fonts/NerdFonts ~/.fonts/
fc-cache -f -v
