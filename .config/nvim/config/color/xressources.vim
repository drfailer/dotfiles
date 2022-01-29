
" Settings:
set background=light

" Fix some colors:

" Fix SignColumn:
highlight clear SignColumn
highlight ColorColumn ctermbg=238 guibg=lightgrey
highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE guifg=NONE guibg=NONE
highlight VertSplit cterm=NONE

" Fix Completion Menu:
" normal item:
highlight Pmenu ctermbg=gray guibg=gray
" selected item:
highlight PmenuSel ctermbg=gray guibg=gray
" scrollbar:
highlight PmenuSbar ctermbg=gray guibg=gray
" thumb scrollbar:
highlight PmenuThumb ctermbg=gray guibg=gray


" Statusline Colors:
if (g:use_my_statusline)
    au InsertEnter * hi statusline cterm=NONE guibg=black guifg=#fe8019 ctermfg=black ctermbg=darkmagenta
    au InsertLeave * hi statusline cterm=NONE guibg=black guifg=#928374 ctermfg=black ctermbg=darkblue
    hi statusline guifg=black guibg=#928374 ctermbg=black ctermfg=darkblue
    hi User1 cterm=NONE ctermfg=250 ctermbg=239 guifg=#ebdbb2 guibg=#504945
    hi User2 cterm=NONE ctermfg=250 ctermbg=236 guifg=#bdae93 guibg=#3c3836
    hi User3 cterm=NONE ctermfg=black ctermbg=black guifg=#ebdbb2 guibg=#282828
    hi User4 cterm=NONE ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
endif
