fun! YankFileName()
  let @a = expand("%:t")
endfun

" quick test function in lisp (note: should use a plugin for this)
nnoremap <leader>rf :call YankFileName()<cr><C-w>ji(load "<C-\><C-n>"api")<cr><C-\><C-n><C-w>k
nnoremap <leader>rr yab<C-w>jpi<cr><C-\><C-n><C-w>k
" same on a vertical split
nnoremap <leader>rvf :call YankFileName()<cr><C-w>li(load "<C-\><C-n>"api")<cr><C-\><C-n><C-w>h
nnoremap <leader>rvr yab<C-w>lpi<cr><C-\><C-n><C-w>h
