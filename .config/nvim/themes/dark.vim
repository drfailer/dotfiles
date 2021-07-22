"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 ████████╗██╗  ██╗███████╗███╗   ███╗███████╗                "
"                 ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝                "
"                    ██║   ███████║█████╗  ██╔████╔██║█████╗                  "
"                    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝                  "
"                    ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗                "
"                    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝                "
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

set termguicolors
colorscheme habanight
