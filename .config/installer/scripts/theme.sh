#!/bin/sh

echo "--- USE THEME ROSE PINE ---"

echo "Downloading rose pine ..."
git clone https://github.com/rose-pine/gtk.git $HOME/.rosetheme

mv $HOME/.rosetheme/rose-pine-gtk /usr/share/themes
mv $HOME/.rosetheme/rose-pine-icons /usr/share/icons

# ~/.gtkrc-2.0
echo "Changing theme and icons in .gtkrc-2.0"
sed -i 's/gtk-theme-name.*/gtk-theme-name="rose-pine-gtk"/' ~/.gtkrc-2.0
sed -i 's/gtk-icon-theme-name.*/gtk-icon-theme-name="rose-pine-icons"/' ~/.gtkrc-2.0

# ~/.config/gtk-3.0/settings.ini
echo "Changing theme and icons in .gtk-3.0/settings.ini"
sed -i 's/gtk-theme-name.*/gtk-theme-name=rose-pine-gtk/' ~/.config/gtk-3.0/settings.ini
sed -i 's/gtk-icon-theme-name.*/gtk-icon-theme-name=rose-pine-icons/' ~/.config/gtk-3.0/settings.ini


rm -r $HOME/.rosetheme

# install theme oh my zsh
echo "Installing zsh theme - spaceship"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# spaceship prompt manual config
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# plugins Oh My Zsh
echo "Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
