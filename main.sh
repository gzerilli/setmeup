#!/bin/bash

##### VARIABLES

original_dir=$HOME/.dotfiles_original
dev_dir=$HOME/dev
dotfiles_dir=$HOME/dev/dotfiles
script_dir=$HOME/dev/dotfiles/scripts
is_git=$?

#####



##### SCRIPT

# Update and upgrade pacman
sudo pacman -Syyu

# Install Git from official repositories
echo -n "Installing Git... "
sudo pacman -S git

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

# Start i3 installation
chmod a+x $script_dir/i3.sh
source $script_dir/i3.sh

# Start URxvt installation
chmod a+x $script_dir/urxvt.sh
source $script_dir/urxvt.sh

#####
