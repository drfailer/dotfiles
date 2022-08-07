################################################################################
#                                 Alias :                                      #
################################################################################
# generals:
alias v='view'
alias vim='vim'
alias e='eedit'
alias fe='fzf-eedit'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -la'
alias grep='grep --color=auto'
alias pdf='pandoc -V geometry:margin=1in -o' # TODO: move to compile function
alias lock='slock' # TODO: make dm scripts for this
alias graph='dot -Tpng -o' # TODO: move to compile function
alias sys='systemctl --failed'
alias journal='journalctl -p 3 -b'
alias vpn='sudo openvpn ~/.config/vpn/vpn-student-tcp.ovpn'
alias zz='zathura'
alias comp='compile'
alias so='source ~/.config/zsh/.zshrc'

# book marks:
alias gc='cd $HOME/Desktop/cours/s2/'
alias gp='cd $HOME/Desktop/progs'
alias gd='cd $HOME/Downloads'
alias gC='cd $HOME/.config/'
alias gsk='cd $HOME/.config/suckless-builds/'
alias gskm='cd $HOME/.config/suckless-builds/dmenu/'
alias gskt='cd $HOME/.config/suckless-builds/st/'
alias gz='cd $HOME/.config/zsh/'
alias gm='cd $HOME/.local/share/music/'

# quick access configs with vim:
alias vs='nvim $HOME/.config/zsh/.zshrc'
alias va='nvim $HOME/.config/zsh/alias.zsh'
alias vc='nvim $HOME/.config/nvim/init.vim'
alias vf='nvim $HOME/.local/share/library.txt'

# quick access configs with emacsclient:
alias es='eedit $HOME/.config/zsh/.zshrc'
alias ea='eedit $HOME/.config/zsh/alias.zsh'
alias ei='eedit $HOME/.emacs.d/init.el'

# java compilation:
alias jcomp='javac *.java'
alias jcompsb='javac -d build src/**/*.java'
alias jcompclass='javac -Xlint:all'

# screen and record
alias screenshot='gnome-screenshot --interactive'
alias reckeys='screenkey -p fixed -g 90%x7%+61%-2%'
