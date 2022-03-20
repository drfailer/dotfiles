"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   TODO:                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! Todo()
"   let createFile = 0
"   if !filereadable("TODO.todo")
"     let projectName = input("Project name: ")
"     let createFile = 1
"   endif
"   execute "vert leftabove split | vertical resize 45 | e TODO.todo"
"   if createFile
"     execute "normal iTODO: " . projectName . "\<cr>"
"     execute "normal " . (6+strlen(projectName)) . "i=\<escape>"
"     execute "normal o\<cr>TODO:\<cr>-----\<cr>\<escape>o- [ ] todo\<escape>"
"   endif
" endfunction

" nnoremap <leader>T :call Todo()<cr>
" autocmd BufRead,BufNewFile *.todo inoremap <buffer> <C-o> <cr>-<space>[<space>]<space>
" autocmd BufRead,BufNewFile *.todo nnoremap <buffer> <C-o> o-<space>[<space>]<space>
" autocmd BufRead,BufNewFile *.todo nnoremap <buffer> <leader>cc 0f[lrx
" autocmd BufRead,BufNewFile *.todo nnoremap <buffer> <leader>uc 0f[lr<space>
" autocmd BufRead,BufNewFile *.todo nnoremap <buffer> <leader>dd 0f[lr#
" autocmd BufRead,BufNewFile *.todo nnoremap <buffer> <leader>cs 0f[lr-
