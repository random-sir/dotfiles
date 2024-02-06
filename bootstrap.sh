#!/bin/sh
#This script is meant to be ran to setup a new arch system
#DEPENDENCIES: pacman, sudo

#install usual packages
sudo pacman -S --needed base-devel git stow neovim fish newsboat wezterm

#stow the dotfiles directory
cd ~/dotfiles
stow .
