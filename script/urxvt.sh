#!/bin/bash



##### SCRIPT

# Check if URxvt is installed
echo -n "Checking if rxvt-unicode is installed... "
if [[ ! -f $HOME/.Xresources ]]; then
	echo "rxvt-unicode not installed, starting installation"
	sudo pacman -S xorg-xrdb rxvt-unicode
else
	echo "rxvt-unicode already installed"
fi

# Create symlink to the updated URxvt config file
echo -n "Checking if custom config file exists... "
if [[ -f $dotfile_dir/Xresorces ]]; then
	ln -s $dotfiles_dir/Xresources $HOME/.Xresources
else
	echo "Custom config file not found, keeping original"
fi
