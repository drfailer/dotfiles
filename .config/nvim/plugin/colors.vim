"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  COLORS:                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Global Settings:
set termguicolors
set background=dark

" Theme Settings:
" let g:gruvbox_italicize_strings=1
" let g:gruvbox_italic=1
" let g:gruvbox_improved_warnings=1
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox
" colorscheme onedark
colorscheme spacegray
hi Normal guibg=none
hi LineNr guibg=none


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Custom Status Line:
" Status Line mods:
" let g:currentmode={
"        \ 'n'  : 'NORMAL ',
"        \ 'v'  : 'VISUAL ',
"        \ 'V'  : 'V·Line ',
"        \ "\<C-V>" : 'V·Block ',
"        \ 'i'  : 'INSERT ',
"        \ 'R'  : 'R ',
"        \ 'Rv' : 'V·Replace ',
"        \ 'c'  : 'Command ',
"        \ 'cv' : 'Vim Ex ',
"        \ 'ce' : 'Ex ',
"        \ 't'  : 'Terminal ',
"        \ 'no' : 'N·Operator Pending ',
"        \ 's'  : 'Select ',
"        \ 'S'  : 'S·Line ',
"        \ 'x19': 'S·Block ',
"        \ 'r'  : 'Prompt ',
"        \ 'rm' : 'More ',
"        \ 'r?' : 'Confirm '
"        \}

" set laststatus=2

" set statusline=
" set statusline+=%0*\ %{toupper(g:currentmode[mode()])}
" set statusline+=%1*\ %f
" set statusline+=\ %m
" set statusline+=%3*%=
" set statusline+=%#CursorColumn#
" set statusline+=%2*\ %{&fileencoding?&fileencoding:&encoding}\ %y
" set statusline+=%1*\ ln:\ %02l/%L\ %p%%\ "
" set statusline+=%0*\ %l:%c\ "
