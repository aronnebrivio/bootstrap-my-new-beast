#!/usr/bin/env bash

# Command Line Tools (CLT) for Xcode
print_style "Installing Command Line Tools for Xcode" "info"
xcode-select --install

# Brew
print_style "Installing Brew" "info"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Brew cask
print_style "Installing Brew Cask" "info"
brew update
brew tap caskroom/cask

print_style "Installing packages" "info"
brew install git git-flow-awh
brew cask install visual-studio-code

brew install rbenv
rbenv init

print_style "Installing Nerd Fonts" "info"
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font
