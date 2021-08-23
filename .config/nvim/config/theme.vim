"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 ████████╗██╗  ██╗███████╗███╗   ███╗███████╗                "
"                 ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝                "
"                    ██║   ███████║█████╗  ██╔████╔██║█████╗                  "
"                    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝                  "
"                    ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗                "
"                    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hbanight:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! s:habanight_setup() abort
    hi Comment gui=italic cterm=italic
    hi Statement gui=bold cterm=bold
    hi VertSplit guibg=NONE ctermbg=NONE
endfunc

augroup colorscheme_change | au!
    au ColorScheme habanight call s:habanight_setup()
augroup END

let g:habanight_transp_bg = v:true
colorscheme habanight


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Metal:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme base16-black-metal


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gruvbox colors
" au InsertEnter * hi statusline guibg=black guifg=#83a598 ctermfg=black ctermbg=magenta
" au InsertLeave * hi statusline guibg=black guifg=#928374 ctermfg=black ctermbg=cyan
" hi statusline guifg=black guibg=#928374 ctermfg=black ctermbg=cyan
" hi User1 ctermfg=007 ctermbg=239 guifg=#ebdbb2 guibg=#504945
" hi User2 ctermfg=007 ctermbg=236 guifg=#bdae93 guibg=#3c3836
" hi User3 ctermfg=0 ctermbg=0 guifg=#ebdbb2 guibg=#282828
" hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

" Habanight colors
au InsertEnter * hi statusline guifg=black guibg=#af87af ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#5f8787 ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#5f8787 ctermfg=black ctermbg=cyan
hi User1 ctermfg=007 ctermbg=239 guibg=#151515 guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#202020 guifg=#adadad
hi User3 ctermfg=0 ctermbg=0 guibg=#101010 guifg=#000000
hi User4 ctermfg=239 ctermbg=239 guibg=#303030 guifg=#4e4e4e


" Status Line Custom
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

set laststatus=2
set noshowmode

set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}
set statusline+=%1*\ %f
set statusline+=\ %m
set statusline+=%3*%=
set statusline+=%#CursorColumn#
set statusline+=%2*\ %{&fileencoding?&fileencoding:&encoding}\ %y
set statusline+=%1*\ ln:\ %02l/%L\ %p%%\ "
set statusline+=%0*\ %l:%c\ "
