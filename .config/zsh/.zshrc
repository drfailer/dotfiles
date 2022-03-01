################################################################################
# ZSH CONFIG:                                                                  #
# AUTHOR: drfailer                                                             #
################################################################################
export PATH="$HOME/.scripts/utils${PATH:+:${PATH}}"


# Uncomment the following line to enable command auto-correction:
ENABLE_CORRECTION="true"

# History settings:
export HISTFILE=$HOME/.local/share/zsh/zhistory
HISTSIZE=1000
SAVEHIST=1000

# Completion:
autoload -Uz compinit
compinit

# export PS1='%B%F{red}[%f%b%B%F{yellow}dr%f%b%B%F{green}@%f%b%B%F{blue}failer%f%b %B%F{magenta}%c%f%b%B%F{red}]%f%b%B%F{grey}$ %f%b'
export PS1='%B%F{magenta}%c%f%b %B%F{blue}➙ %f%b'
# export PS1='%B%F{blue}➙%f%b '


################################################################################
#                                 Sources:                                     #
################################################################################
source ~/.config/zsh/src/alias.zsh
source ~/.config/zsh/src/functions.zsh


################################################################################
#                                 Plugins:                                     #
################################################################################
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-vi-mode.zsh




################################################################################
#                             customize pfetch:                                #
################################################################################
export PF_INFO="ascii title os host kernel uptime pkgs memory"
export PF_SEP=":"
export PF_COLOR=1
export PF_COL1=4
export PF_COL2=3
export PF_COL3=5
export PF_ALIGN="10"
# export PF_ASCII="linux"
export USER="drfailer"
export HOSTNAME="drfailer-computer"
export EDITOR="nvim"
export SHELL="zsh"
export XDG_CURRENT_DESKTOP="xmonad"


################################################################################
#                      Use bat for manual printing:                            #
################################################################################
export BAT_THEME="OneHalfDark"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export BAT_THEME="gruvbox-dark"


################################################################################
# Startup :
################################################################################
# xrdb -load ~/.config/X11/xresources
pfetch
