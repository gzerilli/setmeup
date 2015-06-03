#!/bin/bash



# Check if i3 is installed
echo -n "Checking if i3 is installed... "
if [[ ! -d $HOME/.i3 ]]; then
	echo "i3 not installed, starting installation"
	sudo pacman -S i3
else
	echo "i3 Windows Manager already installed"
fi



# Backup config file in $original_dir
#echo -n "Moving original config file to $original_dir... "
#mv $HOME/.i3/config $original_dir/i3config
#echo "DONE!"



# Create symlink to the updated i3 config file
echo -n "Creating symlink for i3 config file in $HOME/.i3... "
mkdir -p $HOME/.i3
ln -s $dotfiles_dir/i3config $HOME/.i3/config
