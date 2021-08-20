"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗      "
"      ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝      "
"      ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗      "
"      ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║      "
"      ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║      "
"      ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝      "
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

" Formatting code command
autocmd FileType haskell nnoremap <buffer> <leader>f :%!hindent<cr>
autocmd FileType c nnoremap <buffer> <leader>f :%!clang-format --style=Mozilla<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fixing clipboard:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown table format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FormatTable()
  call system('~/.scripts/utils/format_table/format-table "$(xclip -o -selection clipboard)" | xclip -selection clipboard')
  sleep 100m
  execute "norm P"
endfunction

vnoremap <silent> <leader>= d:call FormatTable()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" align:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Align()
  let sep = input("separator:")
  call system('~/.scripts/utils/align/align "' . sep . '" "$(xclip -o -selection clipboard)" | xclip -selection clipboard')
  sleep 100m
  execute "norm P"
endfunction

vnoremap <silent> <leader>a d:call Align()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lsp Bindings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>lr :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>la :lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>lf :lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>lvr :lua vim.lsp.buf.references()<cr>
" diagnostic
nnoremap <leader>lj :lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <leader>lk :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <leader>lsd :lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <leader>ld :lua vim.lsp.diagnostic.set_loclist()<cr>
" help
nnoremap <leader>lh :lua vim.lsp.buf.signature_help()<cr>
" type def
nnoremap <leader>lD :lua vim.lsp.buf.type_definition()<cr>
" workspace
nnoremap <leader>lwa :lua vim.lsp.buf.add_workspace_folder()<cr>
nnoremap <leader>lwr :lua vim.lsp.buf.remove_workspace_folder()<cr>
nnoremap <leader>lwl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>
" implementation
nnoremap <leader>lI :lua vim.lsp.buf.implementation()<cr>
