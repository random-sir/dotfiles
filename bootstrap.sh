#!/bin/sh
#This script is meant to be ran to setup a new arch system
#DEPENDENCIES: pacman, sudo

#install stow
sudo pacman -S --needed stow

#stow the dotfiles directory
cd ~/dotfiles
stow .

#install usual packages
sudo pacman -S --needed base-devel git neovim fish newsboat wezterm ttf-fira-code

#Make Build directory
[ ! -d ~/Builds ] && mkdir ~/Builds

#Build Yay
cd ~/Builds/
[ ! -f /usr/bin/yay ] && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
