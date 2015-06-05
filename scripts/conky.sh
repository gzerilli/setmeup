#!/bin/bash



##### SCRIPT

# Check if Conky is installed
echo -n "Checking if Conky is installed... "
pacman -Qs conky > /dev/null
has_conky=$?
if [[ $has_conky -eq 0 ]]; then
	echo "Conky already installed, backing up original config"
	cp $HOME/.conkyrc $original_dir/conky
else
	echo "Conky not installed, starting installation"
	sudo pacman -S conky
fi

# Create symlink to the updated i3 config file
echo -n "Checking if custom config file exists... "
if [[ -f $config_dir/conkyrc ]]; then
	rm $HOME/.conkyrc
	ln -s $config_dir/conkyrc $HOME/.i3/conkyrc
	ln -s $config_dir/conky-wrapper $HOME/.i3/conky-wrapper
	chmod a+x conky-wrapper
else
	echo "Custom config file not found, keeping original."
fi
