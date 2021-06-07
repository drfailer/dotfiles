typeset -U PATH path

# XDG path:
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# disable less history:
export LESSHISTFILE=-

# Changing paths:
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export XSERVERRC=$XDG_CONFIG_HOME/X11/xserverrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# export GNUPGHOME=$XDG_DATA_HOME/gnupg
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history
export CARGO_HOME=$XDG_DATA_HOME/cargo
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
# export PYTHON_EGG_CACHE="$XDG_CACHE_HOME"/python-eggs
export PYLINTHOME=$XDG_CACHE_HOME/pylint.d
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority
