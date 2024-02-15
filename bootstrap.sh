#!/bin/sh
#This script is meant to be ran to setup a new arch system
#DEPENDENCIES: pacman, sudo

#install stow
sudo pacman -S --needed stow

#stow the dotfiles directory
cd ~/dotfiles
stow .

#install usual packages
sudo pacman -S --needed --noconfirm base-devel git neovim fish newsboat wezterm ttf-fira-code zoxide fzf

#Make Build directory
[ ! -d ~/Builds ] && mkdir ~/Builds

#Build Yay
cd ~/Builds/
[ ! -f /usr/bin/yay ] && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

#Install yay packages
yay -S nbfc-linux

#Optional gnome install and configuration
read -p 'Do you wish to install and configure gnome? (Y/n): ' gnomeOption

if [[ ! $gnomeOption =~ ^[Nn]$ ]]; then
	#Installing gnome and xorg
	sudo pacman -S --needed --noconfirm xorg gnome gnome-extra
	#Installing nvidia drivers
	sudo pacman -S --needed --noconfirm lib32-nvidia-utils nvidia nvidia-prime nvidia-utils
	#Installing pop-shell things
	sudo pacman -S --needed --noconfirm typescript make
	cd ~/Builds
	git clone https://github.com/pop-os/shell.git
	cd shell
	make local-install
	gsettings --schemadir ~/.local/share/gnome-shell/extensions/pop-shell@system76.com/schemas set org.gnome.shell.extensions.pop-shell activate-launcher "['<Super>space']"
	yay -S pop-launcher pop-theme
fi
