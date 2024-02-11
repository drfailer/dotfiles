#!/usr/bin/env bash

set -euo pipefail

################################################################################
#                                  variables                                   #
################################################################################

PATH_TO_DOTFILES=$HOME/dotfiles/
PACKAGE_INSTALL_CMD="sudo pacman -S"

################################################################################
#                                 config files                                 #
################################################################################

echo "start installing df config"

echo "installing .config files"
ln -s $PATH_TO_DOTFILES/.config/i3 $HOME/.config/i3
ln -s $PATH_TO_DOTFILES/.config/tmux $HOME/.config/tmux
ln -s $PATH_TO_DOTFILES/.config/vifm $HOME/.config/vifm

cp -r $PATH_TO_DOTFILES/.config/zathura $HOME/.config/
cp -r $PATH_TO_DOTFILES/.config/htop $HOME/.config/
cp -r $PATH_TO_DOTFILES/.config/alacritty $HOME/.config/
cp -r $PATH_TO_DOTFILES/.config/picom.conf $HOME/.config/
cp -r $PATH_TO_DOTFILES/.config/dunst $HOME/.config/

echo "installing zsh config"
mkdir -p $HOME/.config/zsh/plugins/
ln -s $PATH_TO_DOTFILES/.config/zsh/alias.zsh $HOME/.config/zsh/alias.zsh
ln -s $PATH_TO_DOTFILES/.config/zsh/.zshrc $HOME/.config/zsh/.zshrc
ln -s $PATH_TO_DOTFILES/.config/zsh/scripts $HOME/.config/zsh/scripts

echo "installing zsh pluggins"
cd $HOME/.config/zsh/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd $HOME/

echo "installing home config files"
cp -rf $PATH_TO_DOTFILES/.Xresouces $HOME/
cp -r $PATH_TO_DOTFILES/.clang-format $HOME/
cp -r $PATH_TO_DOTFILES/.gdbinit $HOME/
# cp -r $PATH_TO_DOTFILES/.ghci $HOME/
# cp -r $PATH_TO_DOTFILES/.ghc $HOME/
cp -r $PATH_TO_DOTFILES/.gitignore $HOME/
cp -r $PATH_TO_DOTFILES/.i3status.conf $HOME/
cp -r $PATH_TO_DOTFILES/.zshenv $HOME/
# cp -r $PATH_TO_DOTFILES/.keynavrc $HOME/

################################################################################
#                             package installation                             #
################################################################################

for package in $(ls $PATH_TO_DOTFILES/packages.txt); do
    $PACKAGE_INSTALL_CMD $package
done

################################################################################
#                                   finalize                                   #
################################################################################

echo "changing shell to zsh"
chsh /bin/zsh
