#!/bin/sh
#This script is meant to be ran to setup a new arch system
#DEPENDENCIES: pacman, sudo

#install stow
sudo pacman -S --needed stow

#stow the dotfiles directory
cd ~/dotfiles
stow .

#install usual packages
sudo pacman -S --needed base-devel git neovim fish newsboat wezterm

#Make Build directory
mkdir ~/Builds

#Build Yay
cd ~/Builds/
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
