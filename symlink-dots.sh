#!/bin/sh

ln -sf ~/dotfiles/.gitconfig ~/
ln -sf ~/dotfiles/.zsh ~/
ln -sf ~/dotfiles/.zshenv ~/
ln -sf ~/dotfiles/.zshrc ~/
ln -sf ~/dotfiles/.xinitrc ~/
ln -sf ~/dotfiles/.Xresources ~/
mkdir ~/.config/VSCodium/User/
ln -sf ~/dotfiles/VSCodium/snippets/ ~/.config/VSCodium/User/
ln -sf ~/dotfiles/VSCodium/keybindings.json ~/.config/VSCodium/User/
ln -sf ~/dotfiles/VSCodium/settings.json ~/.config/VSCodium/User/
ln -sf ~/dotfiles/bin ~/.local/
ln -sf ~/dotfiles/.config/* ~/.config/
