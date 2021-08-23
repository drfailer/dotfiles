"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        ██╗   ██╗██╗███╗   ███╗      ██████╗ ██╗     ██╗   ██╗ ██████╗       "
"        ██║   ██║██║████╗ ████║      ██╔══██╗██║     ██║   ██║██╔════╝       "
"        ██║   ██║██║██╔████╔██║█████╗██████╔╝██║     ██║   ██║██║  ███╗      "
"        ╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔═══╝ ██║     ██║   ██║██║   ██║      "
"         ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ███████╗╚██████╔╝╚██████╔╝      "
"          ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/.config/nvim-plug/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim-plug/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Theme
Plug 'habamax/vim-habanight'
Plug 'gruvbox-community/gruvbox'
" better with fd
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" which key
Plug 'liuchengxu/vim-which-key'
" floating terminal
Plug 'voldikss/vim-floaterm'
" goyo
Plug 'junegunn/goyo.vim'
" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" pretty icons
Plug 'ryanoasis/vim-devicons'
" lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'hrsh7th/nvim-compe'
" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

call plug#end()
