"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force saving
cmap w!! w !sudo tee %

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Ib hate escape more than anything else
" inoremap jk <Esc>
inoremap kj <Esc>
inoremap kl <Esc>la

" Easy CAPS
inoremap <c-u> <ESC>viwUea

" navigate threw buffers
nnoremap <Leader>nb :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
" navigate threw tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>nt :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" jump points:
inoremap ,<tab> <Esc>/<++><Enter>"_c4l

" Map replace all :
nnoremap <leader>S :%s//g<Left><Left>
vnoremap <leader>S :s//g<Left><Left>


" change dictionary:
map <F6> :setlocal spell! spelllang=fr,cjk<cr>
map <F7> :set spelllang=en,cjk<cr>

" select first correction for the last miss-spelled word:
nnoremap <M-;> <ESC>1z=

" Toggle auto comment:
map <leader>/ :setlocal formatoptions-=cro<CR>
map <leader># :setlocal formatoptions=cro<CR>


" explorer:
nnoremap <leader>e :vert topleft split <bar> :Ex <bar> :vertical resize 30<CR>

" terminal mode
tnoremap <C-h> <C-\><C-n>


" Fixing clipboard:
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p


" Lsp
nnoremap <leader>R :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>A :lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>F :lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>vr :lua vim.lsp.buf.formatting()<cr>
