# load .gdbinit in the current folder
set auto-load safe-path /

# settings
set history save on
set print pretty on
set pagination off
set confirm off

# alias
alias lremote = target remote localhost:1234
alias sb = save breakpoints
alias sf = source
