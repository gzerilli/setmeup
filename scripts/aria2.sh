#!/bin/bash



##### SCRIPT

# Check if aria2 is installed
echo "Checking if aria2 is installed... "
pacman -Qs aria2 > /dev/null
has_aria2=$?
if [[ $has_aria2 -eq 0 ]]; then
	echo "aria2 already installed"
	if [[ -f $HOME/.aria2/aria2.conf ]]; then
		echo "Backing up config file"
		cp $HOME/.aria2/aria2.conf $original_dir/aria2.conf
		
	fi
else
	echo "aria2 not installed, starting installation"
	sudo pacman -S aria2
fi

# Create symlink to the updated aria2 config file
echo "Checking if custom config file exists... "
if [[ -f $config_dir/aria2.conf ]]; then
	rm $HOME/.aria2/aria2.conf
	ln -s $config_dir/aria2 $HOME/.aria2/aria2.conf
	mkdir -p $HOME/downloads/torrents
	echo "Custom config file installed!
"
else
	echo "Custom config file not found, keeping original
"
fi
