################################################################################
#                                 Alias :                                      #
################################################################################

################################################################################
# generals:
################################################################################
alias v='view'
alias e='$EDITOR'
alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias la='ls -A'
alias ll='ls -la'
alias grep='grep --color=auto'
alias lock='slock'
alias sys='systemctl --failed'
alias journal='journalctl -p 3 -b'
alias vpn='sudo openvpn ~/.config/vpn/vpn-student-tcp.ovpn'
alias zz='zathura'
alias so='source ~/.config/zsh/.zshrc'
alias lg='lazygit'
alias br='bulkrename'
alias fm='vifm . .'
alias weight="du -sh"
alias screenshot='gnome-screenshot --interactive'
alias emoji='copymenu $HOME/.local/share/emojis.txt'

################################################################################
# Tmux:
################################################################################
alias tm='TERM="xterm-256color" tmux'
alias ts='tmux-sessionizer'
alias tsv='tmux splitw -h'
alias tw='TERM="xterm-256color" tmux new-session -ds wiki -c $HOME/Documents/wiki'

################################################################################
# Note:
################################################################################
alias note='NOTE_MENU="fzf" note e'
alias ne='note e'
alias nr='note r'
alias ni='note i'

################################################################################
# Docker:
################################################################################
alias dockerclean='sudo docker images | grep -v TAG | awk "{ print $3 }" | xargs -- sudo docker image rm'

################################################################################
# book marks:
################################################################################
alias gD='cd $HOME/Downloads'
alias gp='cd $HOME/Programming/projects'
alias gw='cd $HOME/Documents/wiki'
alias gS='cd $HOME/.config/zsh/scripts'
alias gC='cd $HOME/.config/'
alias gz='cd $HOME/.config/zsh/'
alias gA='cd $HOME/.config/alacritty/'
alias gv='cd $HOME/.config/nvim/'

alias gd='cd $(fzf --walker=hidden,dir --walker-root="$HOME")'
alias gdd='cd $(fzf --walker=dir)'

################################################################################
# quick edit files
################################################################################
alias vs='$EDITOR $HOME/.bashrc'
alias vs='$EDITOR $HOME/.config/zsh/.zshrc'
alias va='$EDITOR $HOME/.config/zsh/alias.sh'
alias vc='$EDITOR $HOME/.config/nvim/init.lua'
alias vf='$EDITOR $HOME/.local/share/library.txt'
alias vt='$EDITOR $HOME/.config/alacritty/alacritty.yml'

################################################################################
# git
################################################################################
alias g='git'
alias gs='git status'
alias ga='git add -A'
alias gc='git commit '
alias gca='git commit --amend '
alias gm='git merge '
alias gb='git branch -a'
alias gst='git stash'
