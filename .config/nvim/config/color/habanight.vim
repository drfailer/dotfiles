set termguicolors
set background=dark

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
hi Comment guifg=#606060 guibg=NONE gui=NONE cterm=NONE

" Status Line Colrs:
if (g:use_my_statusline)
    au InsertEnter * hi statusline guifg=black guibg=#af87af ctermfg=black ctermbg=magenta
    au InsertLeave * hi statusline guifg=black guibg=#5f8787 ctermfg=black ctermbg=cyan
    hi statusline guifg=black guibg=#5f8787 ctermfg=black ctermbg=cyan
    hi User1 ctermfg=007 ctermbg=239 guibg=#151515 guifg=#adadad
    hi User2 ctermfg=007 ctermbg=236 guibg=#202020 guifg=#adadad
    hi User3 ctermfg=0 ctermbg=0 guibg=#101010 guifg=#000000
    hi User4 ctermfg=239 ctermbg=239 guibg=#303030 guifg=#4e4e4e
endif
