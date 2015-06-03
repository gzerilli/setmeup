#!/bin/bash

##### VARIABLES

original_dir=$HOME/.dotfiles_original
dev_dir=$HOME/dev
dotfiles_dir=$HOME/dev/dotfiles
is_git=$?

#####



##### SCRIPT

# Update and upgrade pacman
sudo pacman -Syyu



# Check if GIT is not installed and download it
echo -n "Checking if Git is installed... "
git --version 2>&1 >/dev/null
if [ ! $is_git -eq 0 ]; then
	echo "Git is not installed.
Installing GIT from official repositories"
	sudo pacman -S git

	# Git basic configuration
	echo "Please enter the user.name you will use with Git"
	read user
	git config --global user.name  "$user"

	echo "Please enter the user.email you will use with Git"
	read email
	git config --global user.email "$email"

	echo "Git basic configuration... DONE!"
else
	echo "Git already installed"
fi



# Create hidden directory to backup original configuration files
echo -n "Creating hidden $original_dir directory to backup config files... "
mkdir -p $original_dir
echo "DONE!"



# Create dev directory to clone the repository (personal preference)
echo -n "Creating $dev_dir to clone the dotfiles repository and change to that directory... "
mkdir -p $dev_dir && cd $dev_dir
echo "DONE!"



# Clone dotfiles repository and change to it
echo "Cloning dotfiles repository and change to it"
git clone https://github.com/$user/dotfiles.git
cd $dotfiles_dir
echo "DONE!"



# Start i3 installation
chmod a+x i3.sh
source i3.sh



# Start URxvt installation
chmod a+x urxvt.sh
source urxvt.sh
#####
