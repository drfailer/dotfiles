################################################################################
#                                 Alias :                                      #
################################################################################
# generals:
alias v='view'
alias e='nvim'
alias em='eedit'
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
alias so='source ~/.config/zsh/.zshrc'
alias tmuxh='nvim ~/.config/tmux/tmux.md'
alias lg='lazygit'

# book marks:
alias gco='cd $HOME/Documents/cours'
alias gd='cd $HOME/Downloads'
alias gp='cd $HOME/Documents/dev/progs'
alias gS='cd $HOME/.config/zsh/scripts'
alias gdd='cd $HOME/Documents/dev/'
alias gC='cd $HOME/.config/'
alias gsk='cd $HOME/.config/suckless-builds/'
alias gskm='cd $HOME/.config/suckless-builds/dmenu/'
alias gskt='cd $HOME/.config/suckless-builds/st/'
alias gz='cd $HOME/.config/zsh/'
alias gM='cd $HOME/.local/share/music/'
alias gv='cd $HOME/.config/nvim/'

# git
alias g='git'
alias ga='git add -A'
alias gc='git commit -m '
alias gca='git commit --amend -m '
alias gm='git merge '
alias gb='git branch '
alias gba='git branch -a'
alias gck='git checkout '

# fzutils
alias mvv='fzutils mv'
alias ccp='fzutils cp'

# quick access configs with vim:
alias vs='nvim $HOME/.config/zsh/.zshrc'
alias va='nvim $HOME/.config/zsh/alias.zsh'
alias vc='nvim $HOME/.config/nvim/init.lua'
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

# fzf directory
cdd() {
  if [ $# -eq 1 ]; then
    cd $(fzutils cd $1)
  else
    cd $(fzutils cd)
  fi
}

# git new branch
gnb() {
  if [ $# -eq 1 ]; then
    # track remote branch if exists
    if [ ! -z $(git branch -r | grep $1) ]; then
      git branch --track $1 origin/$1
    else
      git branch $1
    fi
  else
    echo "ERROR: branch name required"
  fi
}
