#!/bin/bash


# Creating alias for config add command :
config_add () {
    /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add $1
}

###############################################################################
# ADDINGS :
###############################################################################

# Window manager :
config_add $HOME/.xmonad/img/
config_add $HOME/.xmonad/README.md
config_add /home/drfailer/.xmonad/xmonad.hs
config_add $HOME/.xmonad/**/*.hs
config_add $HOME/.config/xmobar
config_add $HOME/.config/picom.conf

# dmenu :
config_add $HOME/.config/Applications/dmenu/config.h

# vim :
config_add /home/drfailer/.config/nvim/

# mutt :
# use mutt wizard

# qutebrowser:
config_add $HOME/.config/qutebrowser/config.py

# Ranger :
config_add $HOME/.config/ranger/

# alacritty :
config_add $HOME/.config/alacritty/

# zsh :
config_add $HOME/.zshenv
config_add $HOME/.config/zsh/.zshrc

# zathura
config_add $HOME/.config/zathura/

# conky
config_add $HOME/.config/conky/conky.conf

# Valgrind :
# config_add $HOME/.valgrindrc

# Adding starship prompt:
config_add $HOME/.config/starship.toml

# scripts:
config_add $HOME/.scripts/calcurse_script/
config_add $HOME/.scripts/utils/
config_add $HOME/.scripts/system/cleaner.sh
config_add $HOME/.scripts/dmenu/record/
config_add $HOME/.scripts/dmenu/sound/
config_add $HOME/.scripts/dmenu/search/
config_add $HOME/.scripts/dmenu/editconf/
config_add $HOME/.scripts/dmenu/theme_selector/
config_add $HOME/.scripts/dmenu/notes/edit-notes
config_add $HOME/.scripts/dmenu/notes/read-note

# Xinit:
config_add $HOME/.xinitrc
config_add /home/drfailer/.Xresources

# ghci:
config_add $HOME/.ghci

###############################################################################
# COMMIT AND PUSH:
###############################################################################

echo "config files added."
sleep 1

# commiting
if [[ $@ != '' ]]; then
    /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m "$@"
else
    /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m "new update"
fi

echo "commiting done"
sleep 1

# push
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push
