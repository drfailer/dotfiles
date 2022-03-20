"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  INIT.VIM                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM PLUG:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-install vim-plug
if empty(glob('~/.config/nvim-plug/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins
call plug#begin('~/.config/nvim-plug/autoload/plugged')

" Better Syntax Support
" Plug 'sheerun/vim-polyglot'

" Better text manipulation
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Themes
" Plug 'gruvbox-community/gruvbox'
Plug 'navarasu/onedark.nvim'
Plug 'ackyshake/Spacegray.vim'

" pretty icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" statusline
Plug 'hoob3rt/lualine.nvim'

" telescope (better with `fd`)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" utilities
Plug 'liuchengxu/vim-which-key'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" git
Plug 'tpope/vim-fugitive'

" completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'onsails/lspkind-nvim'

" lsp plugins
Plug 'neovim/nvim-lspconfig'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" vim wiki
Plug 'vimwiki/vimwiki'

call plug#end()


" load lua config
lua require("dfconfig")

syntax on

" set wikifolder
let g:vimwiki_list = [{'path': '~/Documents/wiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_markdown_link_ext = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCMD:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix filetype
augroup FIX_FILETYPE
  autocmd BufRead,BufNewFile *.tex set filetype=tex
  autocmd BufRead,BufNewFile *.pde set filetype=java
  autocmd BufRead,BufNewFile README.md,*.todo set filetype=markdown
  autocmd BufRead,BufNewFile xmobar* set filetype=haskell
augroup END

" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %

" removing whitespaces
fun! TrimWhitespaces()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup TRIM_WHITE_SPACES
  autocmd!
  autocmd BufWritePre * :call TrimWhitespaces()
augroup END

" folding:
augroup REMEMBER_FOLDS
  autocmd!
  " autocmd BufWritePre * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" highlight on yank
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
