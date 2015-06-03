#!/bin/bash



##### SCRIPT

#Install xorg server
echo -n "Installing xorg server... "
sudo pacman -S xorg-server xorg-server-utils xorg-apps xorg-xinit
echo "DONE!"

#Install driver video
read -n 1 -p "What driver you want to install?
1) Intel
2) Nvidia
3) AMD
" ANS;

case $ANS in
	1)
		sudo pacman -S xf86-video-intel lib32-mesa-libgl;;
	2)
		sudo pacman -S xf86-video-nouveau lib32-mesa-libgl;;
	3)
		sudo pacman -S xf86-video-ati lib32-mesa-libgl;;
esac

# Check if i3 is installed
echo -n "Checking if i3 is installed... "
if [[ ! -d $HOME/.i3 ]]; then
	echo "i3 not installed, starting installation"
	sudo pacman -S i3
else
	echo "i3 Windows Manager already installed"
fi

# Create symlink to the updated i3 config file
echo -n "Checking if custom config file exists... "
if [[ -f $dotfiles_dir/i3config ]]; then
	mkdir -p $HOME/.i3
	ln -s $dotfiles_dir/i3config $HOME/.i3/config
else
	echo "Custom config file not found, keeping original."
fi
