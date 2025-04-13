#!/usr/bin/env bash

set -euo pipefail

DOTFILES_HOME=$HOME/dotfiles/

create_symlink() {
    if ! [ -a $2 ]; then
        echo "create symlink $2."
        ls -s $1 $2
    else
        echo "$2 already installed."
    fi
}

create_copy() {
    if ! [ -a $2 ]; then
        echo "create copy $2."
        cp -r $1 $2
    else
        echo "$2 already installed."
    fi
}

clone_directory() {
    if ! [ -a $2 ]; then
        echo "clone $1."
        git clone --depth 1 $1 $2
    else
        echo "$1 already installed."
    fi
}

# misc
# create_symlink $DOTFILES_HOME/.Xresouces $HOME/.Xresouces
# create_symlink $DOTFILES_HOME/.config/i3 $HOME/.config/i3
# create_symlink $DOTFILES_HOME/.i3status.conf $HOME/.i3status.conf
# create_symlink $DOTFILES_HOME/.config/picom.conf $HOME/.config/picom.conf
# create_symlink $DOTFILES_HOME/.config/vifm $HOME/.config/vifm
# create_symlink $DOTFILES_HOME/.config/zathura $HOME/.config/zathura
# create_symlink $DOTFILES_HOME/.config/htop $HOME/.config/htop
# create_symlink $DOTFILES_HOME/.config/dunst $HOME/.config/dunst
# create_copy $DOTFILES_HOME/.config/alacritty $HOME/.config/alacritty
create_symlink $DOTFILES_HOME/.clang-format $HOME/.clang-format
create_symlink $DOTFILES_HOME/.gdbinit $HOME/.gdbinit
create_symlink $DOTFILES_HOME/.config/tmux $HOME/.config/tmux

# zsh
[ ! -d $HOME/.config/zsh/plugins/ ] && mkdir -p $HOME/.config/zsh/plugins/
create_symlink $DOTFILES_HOME/.zshenv $HOME/.zshenv
create_symlink $DOTFILES_HOME/.config/zsh/.zshrc $HOME/.config/zsh/.zshrc
create_symlink $DOTFILES_HOME/.config/zsh/env.sh $HOME/.config/zsh/env.sh
create_symlink $DOTFILES_HOME/.config/zsh/alias.sh $HOME/.config/zsh/alias.sh
create_symlink $DOTFILES_HOME/.config/zsh/functions.sh $HOME/.config/zsh/functions.sh
create_symlink $DOTFILES_HOME/.config/zsh/scripts $HOME/.config/zsh/scripts
clone_directory https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/plugins/zsh-autosuggestions
clone_directory https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/plugins/zsh-syntax-highlighting

# nvim config
clone_directory https://github.com/drfailer/nvim-config.git $HOME/.config/nvim

# fzf
clone_directory https://github.com/junegunn/fzf.git $HOME/.fzf
echo "make sure to run  $HOME/.fzf/install to complete the installation."
