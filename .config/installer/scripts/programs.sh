#!/bin/sh

echo "Installing programs"

function installing {
    echo "\e[32mInstalling $1 ...\e[0m"
    pacman -S $1 --noconfirm
}

function aur {
    echo "\e[32mInstalling $1 from AUR...\e[0m"
    yay -S $1 --noconfirm
}

installing neovim
installing fzf
installing go
installing cmake
installing luarocks
installing picom
installing kitty
installing nitrogen
installing code
installing zoom
installing geeqie
installing vlc
installing rofi
installing redshift
installing thunar

aur spotify
aur google-chrome
aur slack-desktop
