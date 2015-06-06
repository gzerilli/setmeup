#!/bin/bash



##### SCRIPT

# Check if feh is installed
echo "Checking if feh is installed... "
pacman -Qs feh > /dev/null
has_feh=$?
if [[ $has_feh -eq 0 ]]; then
	echo "feh already installed"
else
	echo "feh not installed, starting installation"
	sudo pacman -S feh imagemagick
fi

# Create symlink to the updated vim config file
echo -n "Checking if a background file exists... "
if [[ -f $config_dir/background.jpg ]]; then
	mkdir -p $HOME/pictures
	ln -s $config_dir/background.jpg $HOME/pictures/background.jpg
	echo "Background image set up!
"
else
	echo "Background file not found, wallpaper not set
"
fi
