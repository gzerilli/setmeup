#!/bin/bash



##### SCRIPT

# Check if mupdf is installed
echo -n "Checking if mupdf is installed... "
pacman -Qs mupdf > /dev/null
has_mupdf=$?
if [[ $has_mupdf -eq 0 ]]; then
	echo "mupdf already installed"
else
	echo "mupdf not installed, starting installation"
	sudo pacman -S mupdf
fi
