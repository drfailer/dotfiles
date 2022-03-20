" add element to lists
" inoremap <buffer> <C-o> <cr>-<space>[<space>]<space>
" nnoremap <buffer> <C-o> o-<space>[<space>]<space>
" nnoremap <buffer> <leader>cc 0f[lrX
" nnoremap <buffer> <leader>uc 0f[lr<space>
" nnoremap <buffer> <leader>dd 0f[lr#
" nnoremap <buffer> <leader>cs 0f[lr-

" compiling using pandoc
nnoremap <leader>rr :!pandoc % -o %:r.pdf<cr>

" augroup COMPILE_MARKDOWN
"   autocmd!
"   autocmd BufWritePost *.md !pandoc % -o %:r.pdf
" augroup END
