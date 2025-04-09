################################################################################
# ZSH CONFIG:                                                                  #
# AUTHOR: drfailer                                                             #
################################################################################

# alias file
source ~/.config/zsh/env.sh
source ~/.config/zsh/alias.sh
source ~/.config/zsh/functions.sh

################################################################################
#                                  zsh config                                  #
################################################################################

# Uncomment the following line to enable command auto-correction:
ENABLE_CORRECTION="true"

# History settings:
export HISTFILE=$HOME/.local/share/zsh/zhistory
export HISTSIZE=1000
export SAVEHIST=1000

# Completion:
autoload -Uz compinit
compinit

# PS1:
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
export PS1='%B%F{magenta}%c%f%b ${vcs_info_msg_0_}%B%F{blue}➙ %f%b'

################################################################################
#                                  Bindings:                                   #
################################################################################
bindkey -e # emacs mode

# open a new terminal in the same directory
new-terminal-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  alacritty --working-directory $PWD
  return $?
}
zle -N new-terminal-widget
bindkey -M emacs '\et' new-terminal-widget

################################################################################
#                                 Plugins:                                     #
################################################################################

ZSH_PLUGIN_DIR=$HOME/.config/zsh/plugins

load_pluggin() {
    if [ -f $ZSH_PLUGIN_DIR/$1 ]; then
      source $ZSH_PLUGIN_DIR/$1
    fi
}

# https://github.com/zsh-users/zsh-autosuggestions.git
load_pluggin zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting.git
load_pluggin zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ocaml
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
