"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 MAPPINGS:                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set leader key
let g:mapleader = "\<Space>"

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

" remape escape and jump next char (for easy skipping closing parent)
inoremap kj <Esc>
inoremap kl <Esc>la

" easy CAPS:
inoremap <c-u> <ESC>viwUea

" navigate threw buffers:
nnoremap <Leader>nb :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

" navigate threw tabs:
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>> :tabnext<CR>
nnoremap <Leader>< :tabprevious<CR>

" Better tabbing:
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" moving lines
nnoremap <up> :move -2<cr>
nnoremap <down> :move +1<cr>

" Quickfix list:
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <C-p> :previous<CR>
nnoremap <C-n> :cnext<CR>

" jump points:
" inoremap ,<tab> <Esc>/<++><Enter>"_c4l

" scrolloff toggle:
" nnoremap <leader>sst :set sidescrolloff=999<CR>
" nnoremap <leader>ssd :set sidescrolloff=0<CR>
" nnoremap <leader>svt :set scrolloff=999<CR>
" nnoremap <leader>svd :set scrolloff=0<CR>

" substitution:
nnoremap <leader>S :%s//g<Left><Left>
vnoremap <leader>S :s//g<Left><Left>
nnoremap <leader>* :%s/\<<C-r><C-w>\>//g<Left><Left>

" change dictionary:
map <F6> :setlocal spell! spelllang=fr,cjk<cr>
map <F7> :set spelllang=en,cjk<cr>

" select first correction for the miss-spelled word under ther cursor:
nnoremap <M-;> <ESC>1z=
nnoremap <left> [s
nnoremap <right> ]s

" Toggle auto comment:
map <leader>/ :setlocal formatoptions-=cro<CR>
map <leader># :setlocal formatoptions=cro<CR>

" explorer:
nnoremap <leader>e :vert split <bar> :Ex<CR>
nnoremap <leader>x :Ex<CR>

" make view
nnoremap <leader>mkv :mkview<CR>

" terminal mode
tnoremap <C-h> <C-\><C-n>
nnoremap <leader>vt :vert split <bar> :terminal<CR>
nnoremap <leader>vtt :split <bar> :terminal<CR>

" fugitive
nmap <leader>gj :diffget //3<cr>
nmap <leader>gf :diffget //2<cr>
nmap <leader>gs :G<cr>
nmap <leader>gc :G commit<cr>
nmap <leader>gp :G push<cr>

" special character insertion <C-i>
inoremap <C-i>t ``<left>
inoremap <C-i>f {}<left>
inoremap <C-i>o []<left>
inoremap <C-i>p \|
inoremap <C-i>h #
inoremap <C-i>n \
