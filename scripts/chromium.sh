#!/bin/bash



##### SCRIPT

# Check if Chromium is installed
echo "Checking if Chromium is installed... "
pacman -Qs chromium > /dev/null
has_chromium=$?
if [[ $has_chromium -eq 0 ]]; then
	echo "Chromium already installed"
else
	echo "Chromium not installed, starting installation"
	sudo pacman -S chromium 
fi

# Installing Chromium plugin for Netflix from AUR
echo "Installing Chromium plugin for Netflix from AUR"
curl -O https://aur.archlinux.org/packages/ch/chromium-widevine/chromium-widevine.tar.gz
tar -xvzf chrom*.tar.gz
rm chrom*.tar.gz && cd chrom*
makepkg -s
sudo pacman -U chrom*.xz
cd ..
rm -r chrom*
echo "DONE!
"

# Installing Chromium plugin for Flash from AUR
echo "Installing Chromium plugin for Flash from AUR"
curl -O https://aur.archlinux.org/packages/ch/chromium-pepper-flash/chromium-pepper-flash.tar.gz
tar -xvzf chrom*.tar.gz
rm chrom*.tar.gz && cd chrom*
makepkg -s
sudo pacman -U chrom*.xz
cd ..
rm -r chrom*
echo "DONE!
"
