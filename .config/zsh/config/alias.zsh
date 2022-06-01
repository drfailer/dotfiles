################################################################################
#                                 Alias :                                      #
################################################################################
# generals:
alias v='view'
alias e='nvim'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -la'
# alias ll='exa -al --color=always --group-directories-first'
alias grep='grep --color=auto'
alias pdf='pandoc -V geometry:margin=1in -o'
alias lock='slock'
alias graph='dot -Tpng -o'
alias sys='systemctl --failed'
alias journal='journalctl -p 3 -b'
alias vpn='sudo openvpn ~/.config/vpn/vpn-student-tcp.ovpn'
alias zz='zathura'
alias key='setxkbmap -layout fr -option ctrl:nocaps'

# book marks:
alias gc='cd $HOME/Desktop/cours/s2/'
alias gp='cd $HOME/Desktop/progs'
alias gd='cd $HOME/Downloads'
alias gC='cd $HOME/.config/'
alias gsk='cd $HOME/.config/suckless-builds/'
alias gskd='cd $HOME/.config/suckless-builds/dwm/'
alias gskm='cd $HOME/.config/suckless-builds/dmenu/'
alias gskt='cd $HOME/.config/suckless-builds/st/'
alias gsks='cd $HOME/.config/suckless-builds/slstatus/'
alias gs='cd $HOME/.scripts/utils/'
alias gdm='cd $HOME/.scripts/dmenu/'
alias gapp='cd $HOME/.config/Application'

# configs:
alias vs='nvim $HOME/.config/zsh/.zshrc'
alias va='nvim $HOME/.config/zsh/config/alias.zsh'
alias vc='nvim $HOME/.config/nvim/init.vim'
alias vf='nvim $HOME/.local/share/library.txt'

# Scripts:
alias pycalc='python3 -i ~/.config/zsh/scripts/calc.py'

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
alias screenshot='gnome-screenshot --interactive'
alias reckeys='screenkey -p fixed -g 90%x7%+61%-2%'
