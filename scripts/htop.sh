#!/bin/bash



##### SCRIPT

# Check if htop is installed
echo "Checking if htop is installed... "
pacman -Qs htop > /dev/null
has_htop=$?
if [[ $has_htop -eq 0 ]]; then
	echo "htop already installed
"
else
	echo "htop not installed, starting installation"
	sudo pacman -S htop
	echo "DONE!
"
fi
