#!/bin/bash



##### SCRIPT

# Check if zsh is installed
echo "Checking if zsh is installed... "
pacman -Qs zsh > /dev/null
has_zsh=$?
if [[ $has_zsh -eq 0 ]]; then
	echo "zsh already installed"
	if [[ -f $HOME/.zshrc ]]; then
		echo "Backing up config file"
		cp $HOME/.zshrc $original_dir/zshrc
		cp $HOME/.zlogin $original_dir/zlogin
		
	fi
else
	echo "zsh not installed, starting installation"
	sudo pacman -S zsh zsh-completions
fi

# Create symlink to the updated zsh config file
echo "Checking if custom config file exists... "
if [[ -f $config_dir/zshrc ]]; then
	rm $HOME/.zshrc
	rm $HOME/.zprofile
	ln -s $config_dir/zshrc $HOME/.zshrc
	ln -s $config_dir/zlogin $HOME/.zlogin
	echo "Custom config file installed!
"
else
	echo "Custom config file not found, keeping original
"
fi
