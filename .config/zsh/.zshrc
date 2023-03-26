################################################################################
# ZSH CONFIG:                                                                  #
# AUTHOR: drfailer                                                             #
################################################################################
export PATH="$HOME/.config/zsh/scripts${PATH:+:${PATH}}"

# Uncomment the following line to enable command auto-correction:
ENABLE_CORRECTION="true"

# History settings:
export HISTFILE=$HOME/.local/share/zsh/zhistory
HISTSIZE=1000
SAVEHIST=1000

# Completion:
autoload -Uz compinit
compinit

# version control
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

# PS1
# export PS1='%B%F{red}[%f%b%B%F{yellow}dr%f%b%B%F{green}@%f%b%B%F{blue}failer%f%b %B%F{magenta}%c%f%b%B%F{red}]%f%b%B%F{grey}$ %f%b'
setopt PROMPT_SUBST
export PS1='%B%F{magenta}%c%f%b ${vcs_info_msg_0_}%B%F{blue}➙ %f%b'

# fix tmux colors
# export TERM="xterm-256color"

# emacs mode
bindkey -e

# alias file
source ~/.config/zsh/alias.zsh


################################################################################
#                                 Plugins:                                     #
################################################################################
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


################################################################################
#                                Some variables:                               #
################################################################################
export USER="drfailer"
export HOSTNAME="drfailer-computer"
export EDITOR="nvim"
export SHELL="zsh"
# export XDG_CURRENT_DESKTOP="xmonad"
export XDG_CURRENT_DESKTOP="i3"


################################################################################
#                      Use bat for manual printing:                            #
################################################################################
# export BAT_THEME="OneHalfDark"
# export BAT_THEME="base16"
export BAT_THEME="gruvbox-dark"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


################################################################################
#                                 Functions:                                   #
################################################################################

# simplify the `find` command
search() {
    find $1 -name $2 -print 2> /dev/null
}

# open a file using the right program
view() {
    case $1 in
        *.jpg|*.png|*.jpeg) nsxiv $1 & ;;
        *.pdf) zathura $1 ;;
        *.csv|*.docx) libreoffice $1 & ;;
        *) echo "ERROR: unknown format"
    esac
}

# extract file
extr() {
    case $1 in
        *.zip) unzip $1 ;;
        *.tar.gz) tar -xvzf $1 ;;
        *.tar) tar -xvf $1 ;;
        *) echo "ERROR: unknown format"
    esac
}

# compile
comp() {
  case $1 in
    *.tex) pdflatex $1 ;;
    *.md) pandoc -o $(echo $1 | sed 's/\.md/\.pdf') $1 ;;
    *.java) javac $1 ;;
    *.c) gcc -Wall -Wextra -Wuninitialized -o prog $1 ;;
    *.cpp|*.cxx) g++ -Wall -Wextra -Wuninitialized -o prog $1 ;;
    *.hs) ghc -dynamic $1 ;;
    *.py) python3 $1 ;;
    *) echo "ERROR: unknown format"
  esac
}

# search a process pid
pss() {
    procs=$(ps aux)
    echo $procs | grep $1 | awk '{ $3=$4=$5=$6=$7=$8=$9=$10="" }1' | column -t -N "OWNER,PID,NAME"
}

# ls search
lss() {
    ls | grep $1
}

# decript a file using gpg
decrypt() {
    gpg -d $1 > $(echo $1 | sed 's/.gpg//')
}

# yank last command
yyc() {
    fc -ln -1 | xclip -i -selection clipboard
}

# increase input capture and change capslock to ctrl
key() {
    xset r rate 300 50
    setxkbmap -layout fr -option ctrl:nocaps
}

# open file in emacs client
eedit() {
    emacsclient -e "(find-file \"$1\")"
}

# eedit using fzf (working in emacs term if emacs server is on)
fzf-eedit() {
    eedit $(fzf)
}

# inverted remove
rrm() {
  saved_files="$1" # TODO: find a way to treat $1 one time

  for e in $@; do
    saved_files=$(echo "$saved_files|$e")
  done

  for r in $(ls | grep -E $saved_files -v); do
    rm -rf $r
  done
}

# git track remote branche
grb() {
  git branch --track $1 origin/$2
}

# add to git ignore (must be at the root of the project)
gi() {
  for f in $@; do
    echo $f >> .gitignore
  done
}
