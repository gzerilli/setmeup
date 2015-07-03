#!/bin/bash



##### SCRIPT

# Check if termite is installed
echo "Checking if termite is installed... "
pacman -Qs termite > /dev/null
has_termite=$?
if [[ $has_termite -eq 0 ]]; then
	echo "termite already installed, backing up original config"
	if [[ -d $HOME/.config/termite ]]; then
		cp -R $HOME/.config/termite $original_dir/termite
else
	echo "termite not installed, starting installation"
	echo "Downloading files from the AUR"
	curl -O https://aur.archlinux.org/packages/te/termite-git/termite-git.tar.gz
	echo "Extracting the tarball"
	tar -xvzf termite*.tar.gz
	rm termite*.tar.gz && cd termite*
	echo "Creating the package"
	makepkg -s
	sudo pacman -U termite*.xz
	cd ..
	echo "Wiping out any trace..."
	rm -r termite*
	echo "DONE!
	"
fi

# Create symlink to the updated termite config file
echo "Checking if custom config file exists... "
if [[ -d $config_dir/termite ]]; then
        rm $HOME/.config/termite
        ln -s $config_dir/termite $HOME/.config/termite
        echo "Custom config file installed!
"
else
        echo "Custom config file not found, keeping original
"
fi

