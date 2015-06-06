#!/bin/bash



##### SCRIPT

# Check if vim is installed
echo "Checking if vim is installed... "
pacman -Qs vim > /dev/null
has_vim=$?
if [[ $has_vim -eq 0 ]]; then
	echo "vim already installed"
	if [[ -f $HOME/.vimrc ]]; then
		echo "Backing up config file"
		cp $HOME/.vimrc $original_dir/vimrc
	fi
else
	echo "vim not installed, starting installation"
	sudo pacman -S vim
fi

# Create symlink to the updated vim config file
echo "Checking if custom config file exists... "
if [[ -f $config_dir/vimrc ]]; then
	rm $HOME/.vimrc
	ln -s $config_dir/vimrc $HOME/.vimrc
	echo "Custom config file installed!
"
else
	echo "Custom config file not found, keeping original
"
fi
