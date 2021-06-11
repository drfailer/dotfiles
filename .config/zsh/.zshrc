#################################################################################
# ZSH CONFIG:                                                                   #
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
#                                 vi mode                                       #
#################################################################################
# Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history


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
alias gc='cd ~/Desktop/cours/cours_s4/'
alias gC='cd ~/.config/'
alias gapp='cd ~/.config/Application'

# configs:
alias vs='nvim ~/.config/zsh/.zshrc'
alias vc='nvim ~/.config/nvim/init.vim'
alias vxb='nvim ~/.config/xmobar/xmobarrc'
alias vxx='nvim ~/.xmonad/xmonad.hs'

# Scripts:
alias dotf='bash $HOME/.scripts/utils/dotf.sh'
alias cleaner='bash $HOME/.scripts/system/cleaner.sh'
alias updater='bash $HOME/.scripts/system/updater.sh'
alias ucalcurse='bash $HOME/.scripts/calcurse_script/calender-import'

# Alias for c compilation:
alias ccc='gcc -Wall -Wextra -o'
# sdl flags
alias SDLA='`sdl-config --cflags --libs`'
# java compilation:
alias jcomp='javac *.java'
alias jcompsb='javac -d build src/**/*.java'
alias jcompclass='javac -Xlint:all'

# sound:
alias mute='amixer -D pulse sset Master mute'
alias unmute='amixer -D pulse sset Master unmute'
alias setsound='amixer -D pulse sset Master'

# For bare repo :
# be sure tu run : config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


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
export EDITOR="neovim"
export SHELL="zsh"
export XDG_CURRENT_DESKTOP="xmonad"


#################################################################################
#                      Use bat for manual printing:                             #
#################################################################################
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="OneHalfDark"


# Starship prompt:
eval "$(starship init zsh)"


# Startup :
# xrdb -load ~/.config/X11/xresources
pfetch
