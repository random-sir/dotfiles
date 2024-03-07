#!/bin/sh
#This script is meant to be ran to setup a new arch system
#DEPENDENCIES: pacman, sudo

#Make sure that sed is installed (required by base so should always be)
sudo pacman -S --needed --noconfirm sed

#Use sed to activate pacman settings I like
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf #Color
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf #Parallel Downloads (There might be a better way to do this)

#install reflector
sudo pacman -S --needed --noconfirm reflector

#copy config
sudo cp ~/dotfiles/reflector.conf /etc/xdg/reflector

#Enable reflector timer
sudo systemctl enable reflector.timer

#Start reflector service once (Fix mirrors)
echo 'Fetching and configuring the best mirrors'
sudo systemctl start reflector.service

#Force update to make sure everything is okay
sudo pacman -Syyuu

#Install stow
sudo pacman -S --needed --noconfirm stow

#Stow the dotfiles directory
mkdir ~/.config
cd ~/dotfiles
stow .

#Organizing what I want to install
terminal='wezterm python-nautilus ttf-nerd-fonts-symbols-mono noto-fonts-emoji ttf-fira-code'
fish='fish fisher'
browser='firefox'
development='base-devel git neovim git-delta xclip'
misc='pacman-contrib newsboat zoxide fzf zellij'

#Install usual packages
sudo pacman -S --needed --noconfirm $terminal $fish $browser $development $misc 

#Make Build directory
[ ! -d ~/Builds ] && mkdir ~/Builds

#Build Yay
cd ~/Builds/
[ ! -f /usr/bin/yay ] && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

#Install yay packages
yay -S --needed nbfc-linux

read -p 'Do you wish to configure nbfc (notebook fan control) using Acer nitro 5 preset? (Y/n): ' nbfcOption 

if [[ ! $nbfcOption =~ ^[Nn]$ ]]; then
	sudo nbfc config --set 'Acer Nitro AN515-51'
	sudo nbfc start
	sudo systemctl enable nbfc_service
fi

#Optional gnome install and configuration
read -p 'Do you wish to install and configure gnome? (Y/n): ' gnomeOption

if [[ ! $gnomeOption =~ ^[Nn]$ ]]; then
	#Installing gnome and xorg
	sudo pacman -S --needed --noconfirm xorg gnome gnome-extra libsecret libgnome-keyring seahorse
	#Installing nvidia things
	sudo pacman -S --needed --noconfirm lib32-nvidia-utils nvidia nvidia-prime nvidia-utils switcheroo-control
	#Enabling switcheroo
	sudo systemctl enable gdm.service
	sudo systemctl enable switcheroo-control.service
	#Installing pop-shell things
	sudo pacman -S --needed --noconfirm typescript make
	cd ~/Builds
	git clone https://github.com/pop-os/shell.git
	cd shell
	make local-install
	gsettings --schemadir ~/.local/share/gnome-shell/extensions/pop-shell@system76.com/schemas set org.gnome.shell.extensions.pop-shell activate-launcher "['<Super>space']"
	yay -S pop-launcher pop-theme
fi

read -p 'Do you wish to install NvChad? (Y/n): ' neovimOption

if [[ ! $neovimOption =~ ^[Nn]$ ]]; then
  #Installing NvChad
  rm -rf ~/.config/nvim
  rm -rf ~/.local/share/nvim
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
  NVCHAD_EXAMPLE_CONFIG=n nvim --headless "+q"

  #Adding my personal config
  cd ~/dotfiles
  rm -rf ~/.config/nvim/lua/custom
  stow .
fi
