#!/bin/bash



##### SCRIPT

# Check if URxvt is installed
echo "Checking if rxvt-unicode is installed... "
pacman -Qs urxvt > /dev/null
has_urxvt=$?
if [[ $has_urxvt -eq 0 ]]; then
	echo "rxvt-unicode already installed"
	if [[ -f $HOME/.Xresources ]]; then
		echo "Backing up config file"
		cp $HOME/.Xresources $original_dir/Xresources
	fi
else
	echo "rxvt-unicode not installed, starting installation"
	sudo pacman -S xorg-xrdb rxvt-unicode
fi

# Create symlink to the updated URxvt config file
echo "Checking if custom config file exists... "
if [[ -f $config_dir/Xresorces ]]; then
	rm $HOME/.Xresources
	ln -s $config_dir/Xresources $HOME/.Xresources
	echo "Custom config file installed!
"
else
	echo "Custom config file not found, keeping original
"
fi
