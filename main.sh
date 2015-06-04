#!/bin/bash

##### VARIABLES

original_dir=$HOME/.dotfiles_original
dev_dir=$HOME/dev
config_dir=$HOME/dev/dotfiles/config
scripts_dir=$HOME/dev/dotfiles/scripts
scripts="i3 urxvt vim feh"

#####



##### SCRIPT

# Update and upgrade pacman
sudo pacman -Syyu

# Checking if Git is installed
pacman -Qs git > /dev/null
has_git=$?
if [[ $has_git -eq 0 ]]; then
	echo "Git already installed!"
else
	echo -n "Git not installed. Installing Git... "
	sudo pacman -S git
	echo "DONE!"
fi

# Git basic configuration
echo "Please enter the user.name you will use with Git"
read user
git config --global user.name  "$user"

echo "Please enter the user.email you will use with Git"
read email
git config --global user.email "$email"

echo "Git basic configuration... DONE!"

# Create hidden directory to backup original configuration files
echo -n "Creating hidden $original_dir directory to backup config files... "
mkdir -p $original_dir
echo "DONE!"

# Create dev directory to clone the repository (personal preference)
echo -n "Creating $dev_dir to clone the dotfiles repository and change to that directory... "
mkdir -p $dev_dir && cd $dev_dir
echo "DONE!"

# Clone dotfiles repository and change to it
echo "Cloning dotfiles repository... "
git clone https://github.com/$user/dotfiles.git
echo "DONE!"

# Start launching scripts
for script in $scripts; do
	echo "Giving executable permission to $script.sh"
	chmod +x $script.sh
	echo "Executing $script.sh"
	source $script.sh
done

# Start i3 installation
#chmod a+x $scripts_dir/i3.sh
#source $scripts_dir/i3.sh

# Start URxvt installation
#chmod a+x $scripts_dir/urxvt.sh
#source $scripts_dir/urxvt.sh

# Start vim installation
#chmod a+x $scripts_dir/vim.sh
#source $scripts_dir/vim.sh

# Start feh installation
#chmod a+x $scripts_dir/feh.sh
#source $scripts_dir/feh.sh

#####
