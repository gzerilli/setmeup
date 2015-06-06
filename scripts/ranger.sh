#!/bin/bash



##### SCRIPT

# Check if Ranger is installed
echo "Checking if Ranger is installed... "
pacman -Qs ranger > /dev/null
has_ranger=$?
if [[ $has_ranger -eq 0 ]]; then
	echo "Ranger already installed, backing up original config"
	if [[ -d $HOME/.config/ranger ]]; then
		cp -R $HOME/.config/ranger $original_dir/ranger
	fi
else
	echo "Ranger not installed, starting installation"
	sudo pacman -S ranger udisks2 udiskie
	ranger --copy-config=all
fi

# Create symlink to the updated Ranger config directory
echo "Checking if custom config file exists... "
if [[ -d $config_dir/ranger ]]; then
	sudo rm -r $HOME/.config/ranger
	ln -s $config_dir/ranger $HOME/.config/
	echo "Custom config file installed!
"
else
	echo "Custom config file not found, keeping original.
"
fi
