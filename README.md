# setmeup v0.1
Script that autoconfigure Arch Linux with some useful applications (of my choice).

The main.sh calls the other scripts and make use of the dotfiles repository to get the configuration files.

## Use
1. fork both the **setmeup** and the **dotfiles** repositories
2. **curl** the main.sh file from the **setmeup** repository
3. answer eventual questions or decisions

## Content
In order this script will install:
  1. the **[i3wm](https://wiki.archlinux.org/index.php/I3)** tiling window manager including:
    1. your choice of video driver (Nvidia, ATI, Intel or skip)
    2. **[Xorg](https://wiki.archlinux.org/index.php/Xorg)** server
  2. **[vim](https://wiki.archlinux.org/index.php/Vim)** text editor
  3. **[feh](https://wiki.archlinux.org/index.php/Feh)** a lightweight image viewer that will set this background:
    1. ![bg image](https://raw.githubusercontent.com/gzerilli/gzerilli.github.io/master/bg.jpg?token=AHmjR535_9xaCQdddFarzZzCSGjac1dYks5Vn8z_wA%3D%3D)
  4. **[mupdf](http://mupdf.com/)** a lightweight PDF and XPS viewer
  5. **[htop](http://hisham.hm/htop/)** an interactive process viewer
  6. A piped **[conky](https://wiki.archlinux.org/index.php/Conky)** system monitor into i3bar using JSON inputs:
    1. **[ttf-font-awesome](http://fortawesome.github.io/Font-Awesome/)**
    2. ![conky scrot](https://raw.githubusercontent.com/gzerilli/gzerilli.github.io/master/conky.png?token=AHmjR_DJOjsIjcLhxuxEMEe_NIXb1p3Cks5Vn8awwA%3D%3D)
  7. the text-based file manager **[ranger](https://wiki.archlinux.org/index.php/Ranger)** including **[UDisks](https://wiki.archlinux.org/index.php/Udisks)** and **[Udiskie](https://wiki.archlinux.org/index.php?title=Udiskie&redirect=no)** for automounting removable storage
  8. **[xbindkeys](https://wiki.archlinux.org/index.php/Xbindkeys)** to bind some multimedia keys (VolumeUP, VolumeDOWN, Mute)
  9. **[chromium](https://wiki.archlinux.org/index.php/Chromium)** web browser including:
    1. **[chromium-pepper-flash](https://aur.archlinux.org/packages/chromium-pepper-flash/)** plugin from the AUR as Flash Player plugin
    2. **[chromium-widevine](https://aur.archlinux.org/packages/chromium-widevine/)** plugin from the AUR that allows to watch Netflix
  10. **[aria2](https://wiki.archlinux.org/index.php/Aria2)** lightweight, multi-protocol and multi-source command line download utility
  11. **[termite](https://wiki.archlinux.org/index.php/Termite)** as terminal emulator
  12. **[zsh](https://wiki.archlinux.org/index.php/Zsh)** as shell. The script will also set zsh as main shell.

