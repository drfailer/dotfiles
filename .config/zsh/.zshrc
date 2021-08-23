#################################################################################
# ZSH CONFIG :                                                                  #
# author: drfailer                                                              #
#################################################################################
export PATH="$HOME/.local/share/cargo/bin${PATH:+:${PATH}}"


# Uncomment the following line to enable command auto-correction:
ENABLE_CORRECTION="true"

# History settings:
export HISTFILE=$HOME/.local/share/zsh/zhistory
HISTSIZE=1000
SAVEHIST=1000

# Completion:
autoload -Uz compinit
compinit


#################################################################################
#                                 Plugins:                                      #
#################################################################################
source /home/drfailer/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/drfailer/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/drfailer/.config/zsh/plugins/zsh-vi-mode.zsh


#################################################################################
#                                 Alias :                                       #
#################################################################################
# generals:
alias v='nvim'
alias vim='nvim'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='exa -al --color=always --group-directories-first'
alias grep='grep --color=auto'
alias pdf='pandoc -V geometry:margin=1in -o'
alias lock='slock'
alias vpn='sudo openvpn ~/.config/vpn/vpn-student-tcp.ovpn'
alias graph='dot -Tpng -o'
alias processing='/home/drfailer/Programming/processing-3.5.4/processing'

# book marks:
alias gc='cd $HOME/Desktop/cours/cours_s4/'
alias gC='cd $HOME/.config/'
alias gs='cd $HOME/.scripts/'
alias gdm='cd $HOME/.scripts/dmenu/'
alias gapp='cd $HOME/.config/Application'

# configs:
alias vs='nvim $HOME/.config/zsh/.zshrc'
alias vc='nvim $HOME/.config/nvim/init.vim'
# alias vxb='nvim -c ":Files $HOME/.config/xmobar/"'

# Scripts:
alias dotf='bash $HOME/.scripts/utils/dotf.sh'
alias status='exec $HOME/.scripts/system/status'
alias ucalcurse='bash $HOME/.scripts/calcurse_script/calender-import'
alias status='exec $HOME/.scripts/system/status'
alias colorscheme='bash $HOME/.scripts/dmenu/theme_selector/theme_selector'

# Alias for c compilation:
alias ccc='gcc -Wall -Wextra -o'
# sdl flags
alias SDLA='`sdl-config --cflags --libs`'
# java compilation:
alias jcomp='javac *.java'
alias jcompsb='javac -d build src/**/*.java'
alias jcompclass='javac -Xlint:all'

# For bare repo :
# be sure tu run : config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# screen and record
alias screen='gnome-screenshot --interactive'
alias record='exec $HOME/.scripts/dmenu/record/record'


#################################################################################
#                             customize pfetch:                                 #
#################################################################################
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


#################################################################################
#                      Use bat for manual printing:                             #
#################################################################################
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export BAT_THEME="OneHalfDark"
export BAT_THEME="gruvbox-dark"


# Starship prompt:
eval "$(starship init zsh)"


# Startup :
# xrdb -load ~/.config/X11/xresources
pfetch
