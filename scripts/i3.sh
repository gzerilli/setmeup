#!/bin/bash



##### SCRIPT

#Install Xorg server
echo "Checking if Xorg is installed..."
pacman -Qs xorg > /dev/null
has_xorg=$?
if [[ $has_xorg -eq 0 ]]; then
	echo "Xorg already installed"
	if [[ -f $HOME/.xinitrc ]]; then
		echo "Backing up config file"
		cp $HOME/.xinitrc $original_dir/xinitrc
	fi
else
	echo "Xorg not installed. Installing Xorg... "
	sudo pacman -S xorg-server xorg-server-utils xorg-apps xorg-xinit
	echo "DONE!"
fi

# Create symlink to update Xorg configuration
echo "Checking if custom config file exists... "
if [[ -f $config_dir/xinitrc ]]; then
	rm $HOME/.xinitrc
	ln -s $config_dir/xinitrc $HOME/.xinitrc
	echo "Custom config file installed!
"
else
	echo "Custom config file not found, keeping original.
"
fi

#Install driver video
read -n 1 -p "What driver you want to install?
1) Intel
2) Nvidia
3) AMD
4) Skip this passage
" ANS;

case $ANS in
	1)
		sudo pacman -S xf86-video-intel lib32-mesa-libgl;;
	2)
		sudo pacman -S xf86-video-nouveau lib32-mesa-libgl;;
	3)
		sudo pacman -S xf86-video-ati lib32-mesa-libgl;;
	4)
		echo "Skipping installation of video drivers
"
esac

# Check if i3 is installed
echo "Checking if i3 is installed... "
pacman -Qs i3 > /dev/null
has_i3=$?
if [[ $has_i3 -eq 0 ]]; then
	echo "i3 Windows Manager already installed, backing up config files"
	cp $HOME/.i3/config $original_dir/i3config
else
	echo "i3 not installed, starting installation"
	sudo pacman -S i3
	mkdir -p $HOME/.i3
fi

# Create symlink to the updated i3 config file
echo "Checking if custom config file exists... "
if [[ -f $config_dir/i3config ]]; then
	rm $HOME/.i3/config
	ln -s $config_dir/i3config $HOME/.i3/config
	echo "Custom config file installed!
"
else
	echo "Custom config file not found, keeping original.
"
fi
