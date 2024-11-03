################################################################################
#                                 Alias :                                      #
################################################################################

################################################################################
# generals:
################################################################################
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
alias er='nvim rapport.tex'
alias at='alacritty-themes'
alias br='bulkrename'
alias fm='vifm . .'
alias weight="du -sh"

# java compilation:
alias jcomp='javac *.java'
alias jcompsb='javac -d build src/**/*.java'
alias jcompclass='javac -Xlint:all'

# screen and record
alias screenshot='gnome-screenshot --interactive'
alias reckeys='screenkey -p fixed -g 90%x7%+61%-2%'
alias emoji='copymenu $HOME/.local/share/emojis.txt'

# launch tmux with the right colors
alias tm='TERM="xterm-256color" tmux'
alias ts='tmux-sessionizer'
alias tsv='tmux splitw -h'
alias nw='tmux new-session -ds wiki -c $HOME/Documents/wiki'

# use the note script in terminal
alias note='NOTE_MENU="fzf" note e'
alias ne='note e'
alias nr='note r'
alias ni='note i'

# docker
alias dockerclean='sudo docker images | grep -v TAG | awk "{ print $3 }" | xargs -- sudo docker image rm'

################################################################################
# book marks:
################################################################################
alias gco='cd $HOME/Documents/cours'
alias gd='cd $HOME/Downloads'
alias gp='cd $HOME/Documents/dev/progs'
alias gw='cd $HOME/Documents/wiki'
alias gS='cd $HOME/.config/zsh/scripts'
alias gdd='cd $HOME/Documents/dev/'
alias gC='cd $HOME/.config/'
alias gsk='cd $HOME/.config/suckless-builds/'
alias gskm='cd $HOME/.config/suckless-builds/dmenu/'
alias gskt='cd $HOME/.config/suckless-builds/st/'
alias gz='cd $HOME/.config/zsh/'
alias gA='cd $HOME/.config/alacritty/'
alias gM='cd $HOME/.local/share/music/'
alias gv='cd $HOME/.config/nvim/'

################################################################################
# git
################################################################################
alias g='git'
alias gs='git status'
alias ga='git add -A'
alias gc='git commit '
alias gca='git commit --amend '
alias gm='git merge '
alias gb='git branch '
alias gba='git branch -a'
alias gckt='git checkout '
alias gst='git stash'
alias gl='git log'
alias grl='git reflog | fzf | awk "{print $1}" | xclip -i -selection clipboard'

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
    selected=$(git branch -a | grep remotes/origin | fzf --prompt="git branch> " --height 40% --reverse | sed 's/\s*remotes\/origin\///')
    git branch --track $selected origin/$selected
  fi
}

# fzf scripts:

gck() {
  chosen=$(git branch | grep "  .*" | sed 's/  //' | fzf --prompt="git-branch > " --height 40% --reverse)
  if [ ! -z $chosen ]; then
    git checkout $chosen
  fi
}

gtrack() {
  chosen=$(git branch -r | sed 's/  origin\///' | fzf --prompt="track-branch > " --height 40% --reverse)
  if [ ! -z $chosen ]; then
    git checkout --track $chosen
  fi
}

################################################################################
# fzutils
################################################################################
alias mvv='fzutils mv'
alias ccp='fzutils cp'
alias md='fzutils mv ~/Downloads/'
alias cdd='cd $(fzutils cd)'

################################################################################
# quick edit files
################################################################################
alias vs='nvim $HOME/.config/zsh/.zshrc'
alias va='nvim $HOME/.config/zsh/alias.zsh'
alias vc='nvim $HOME/.config/nvim/init.lua'
alias vf='nvim $HOME/.local/share/library.txt'
alias vt='nvim $HOME/.config/alacritty/alacritty.yml'

# quick access configs with emacsclient:
alias es='eedit $HOME/.config/zsh/.zshrc'
alias ea='eedit $HOME/.config/zsh/alias.zsh'
alias ei='eedit $HOME/.emacs.d/init.el'
