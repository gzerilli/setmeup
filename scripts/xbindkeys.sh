#!/bin/bash



##### SCRIPT

# Check if xbindkeys is installed
echo -n "Checking if xbindkeys is installed... "
pacman -Qs xbindkeys > /dev/null
has_xbindkeys=$?
if [[ $has_xbindkeys -eq 0 ]]; then
	echo "xbindkeys already installed"
	if [[ -f $HOME/.xbindkeysrc ]]; then
		cp $HOME/.xbindkeysrc $original_dir/xbindkeysrc
	fi
else
	echo "xbindkeys not installed, starting installation"
	sudo pacman -S xbindkeys
fi

# Create symlink to the updated URxvt config file
echo -n "Checking if custom config file exists... "
if [[ -f $config_dir/xbindkeysrc ]]; then
	rm $HOME/.xbindkeysrc
	ln -s $config_dir/xbindkeysrc $HOME/.xbindkeysrc
else
	echo "Custom config file not found, keeping original"
fi
