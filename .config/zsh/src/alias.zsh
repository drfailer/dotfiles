################################################################################
#                                 Alias :                                      #
################################################################################
# generals:
alias v='nvim'
alias vim='nvim'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -la'
# alias ll='exa -al --color=always --group-directories-first'
alias grep='grep --color=auto'
alias pdf='pandoc -V geometry:margin=1in -o'
alias lock='slock'
alias graph='dot -Tpng -o'
alias calc='~/.scripts/apps/Haskell-calc/calc'
alias copy='~/.scripts/utils/copy'
alias sys='systemctl --failed'
alias journal='journalctl -p 3 -b'
# alias vpn='sudo openvpn ~/.config/vpn/vpn-student-tcp.ovpn'

# book marks:
alias gc='cd $HOME/Desktop/cours/cours_s4/'
alias gp='cd $HOME/Desktop/progs'
alias gd='cd $HOME/Downloads'
alias gC='cd $HOME/.config/'
alias gsk='cd $HOME/.config/suckless-builds/'
alias gs='cd $HOME/.scripts/'
alias gdm='cd $HOME/.scripts/dmenu/'
alias gapp='cd $HOME/.config/Application'

# configs:
alias vs='nvim $HOME/.config/zsh/.zshrc'
alias va='nvim $HOME/.config/zsh/src/alias.zsh'
alias vc='nvim $HOME/.config/nvim/init.vim'
alias vf='nvim $HOME/.config/suckless-builds/dmenu-scripts/search/library.txt'

# Scripts:
alias dotf='~/.scripts/utils/dotf'
alias ta='~/.scripts/utils/agenda'

# Alias for c compilation:
alias ccc='gcc -Wall -Wextra -o'
# sdl flags
alias SDLA='`sdl-config --cflags --libs`'
# java compilation:
alias jcomp='javac *.java'
alias jcompsb='javac -d build src/**/*.java'
alias jcompclass='javac -Xlint:all'

# For bare repo :
# be sure to run : config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# screen and record
alias screen='gnome-screenshot --interactive'
alias record='exec $HOME/.scripts/dmenu/record/record'
