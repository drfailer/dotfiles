"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 ████████╗██╗  ██╗███████╗███╗   ███╗███████╗                "
"                 ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝                "
"                    ██║   ███████║█████╗  ██╔████╔██║█████╗                  "
"                    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝                  "
"                    ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗                "
"                    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Variables:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:use_my_statusline=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes Settings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.config/nvim/config/color/gruvbox.vim
" source ~/.config/nvim/config/color/habanight.vim
" source ~/.config/nvim/config/color/xressources.vim
" colorscheme wal
" hi CursorLine term=bold cterm=bold guibg=Grey40


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line mods:
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \ 'cv' : 'Vim Ex ',
       \ 'ce' : 'Ex ',
       \ 't'  : 'Terminal ',
       \ 'no' : 'N·Operator Pending ',
       \ 's'  : 'Select ',
       \ 'S'  : 'S·Line ',
       \ 'x19': 'S·Block ',
       \ 'r'  : 'Prompt ',
       \ 'rm' : 'More ',
       \ 'r?' : 'Confirm '
       \}

set noshowmode
if (g:use_my_statusline)
  set laststatus=2

  set statusline=
  set statusline+=%0*\ %{toupper(g:currentmode[mode()])}
  set statusline+=%1*\ %f
  set statusline+=\ %m
  set statusline+=%3*%=
  set statusline+=%#CursorColumn#
  set statusline+=%2*\ %{&fileencoding?&fileencoding:&encoding}\ %y
  set statusline+=%1*\ ln:\ %02l/%L\ %p%%\ "
  set statusline+=%0*\ %l:%c\ "
endif
