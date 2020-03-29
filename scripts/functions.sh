#!/usr/bin/env bash

switchToFish() {
    print_style "Switching to fish as default shell" "info"
    chsh -s $(which fish)
}

installOMF() {
    print_style "Installing Oh My Fish (OMF)" "info"
    rm -rf ~/.local/share/omf
    curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > omf_install
    chmod +x omf_install
    ./omf_install --noninteractive
}

installRubyColorls() {
    print_style "Installing Ruby and Colorls" "info"
    rbenv install 2.7.0
    rbenv global 2.7.0
    gem install colorls
    rbenv rehash
    source $(dirname $(gem which colorls))/tab_complete.sh
}

installPortainer() {
    print_style "Installing Portainer" "info"
    docker volume create portainer_data
    docker run -d -p 8000:8000 -p 9999:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
}
