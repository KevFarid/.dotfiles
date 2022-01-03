#!/bin/sh
echo "Setting up Noto Emoji font..."
# 1 - install  noto-fonts-emoji package
pacman -S noto-fonts-emoji --noconfirm
pacman -S powerline-fonts --noconfirm
pacman -S ttf-dejavu ttf-liberation noto-fonts --noconfirm

yay -S nerd-fonts-ubuntu-mono

echo "Installing JetBrains Mono"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

echo "Installing Fira Code"
pacman -S ttf-fira-code --noconfirm

echo "Installing emoji config for Arch"
echo "Recommended system font: inconsolata regular (ttf-inconsolata or powerline-fonts)"
# 2 - add font config to /etc/fonts/conf.d/01-notosans.conf
echo "<?xml version=\"1.0\"?>
<!DOCTYPE fontconfig SYSTEM \"fonts.dtd\">
<fontconfig>
 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Noto Sans</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Sans</family>
   </prefer>
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Noto Serif</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
     <family>DejaVu Serif</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Noto Mono</family>
    <family>Noto Color Emoji</family>
    <family>Noto Emoji</family>
    <family>DejaVu Sans Mono</family>
   </prefer>
 </alias>
</fontconfig>

" > /etc/fonts/local.conf
# 3 - update font cache via fc-cache
fc-cache
echo "Noto Emoji Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, your default font contains emojis."
echo "consider inconsolata regular"
