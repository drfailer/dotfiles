" avoid loading twice
if exists("current_compiler")
  finish
endif
let current_compiler = "shell"

" check if CompilerSet command exists
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=bash\ %
CompilerSet errorformat=%f:\ line\ %l:\ %m

