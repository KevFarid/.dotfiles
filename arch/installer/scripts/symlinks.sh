#!/bin/sh

echo "Removing existing dotfiles"
# remove files if they already exist
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim ~/.config/kitty 2> /dev/null

echo "Creating symlinks ..."
# Neovim expects some folders already exist
mkdir -p ~/.config ~/.config/nvim ~/.config/nvim/lua ~/.config/kitty

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sF ~/dotfiles/kitty/ ~/.config/
ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sF ~/dotfiles/nvim/lua/ ~/.config/nvim/
ln -sF ~/dotfiles/arch/qtile ~/.config/
