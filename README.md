# My dotfiles

This repo contains important configs for things I use

## Usage

For an easy setup you may simply run the [boostrap.sh](#bootstrap) script.

For a manual/minimal setup you must install stow and run the following commmands on the directory where you cloned the dotfiles repo
    
    $ mkdir ../.config #if .config doesn't exist stow symlinks .config TO the stowed directory
    $ stow .
Then install whatever packages you actually want.
### Bootstrap <a name="bootstrap"></a>
#### Dependencies:
- Sudo
- Pacman

#### Functionality
This script is responsible for the following things:

- Setting up important dotfiles through stow
- Installing some useful/necessary packages
- Creating a Build directory
- Building and installing Yay (AUR helper)
- Installing yay packages
- Configuring nbfc (optional)
- Configuring DE with gnome and pop-shell (optional)
