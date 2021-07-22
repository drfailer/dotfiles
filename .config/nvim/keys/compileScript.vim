"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗██╗     ███████╗██████╗        "
"       ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║██║     ██╔════╝██╔══██╗       "
"       ██║     ██║   ██║██╔████╔██║██████╔╝██║██║     █████╗  ██████╔╝       "
"       ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║██║     ██╔══╝  ██╔══██╗       "
"       ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║███████╗███████╗██║  ██║       "
"        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Compile()
  let fileType = expand("%:e")
  if (fileType == "md")
    execute "!pandoc -V geometry:margin:1in -o " . expand("%:t:r") . ".pdf %"
  elseif (fileType == "tex")
    execute "!pdflatex -interaction=nonstopmode %"
  elseif (fileType == "c")
    execute "!gcc -Wall -Wextra -o prog % && ./prog"
  elseif (fileType == "hs")
    execute "!runghc %"
  elseif (fileType == "py")
    execute "!python3 %"
  endif
endfunction

nnoremap <leader>B :call Compile()<CR>
