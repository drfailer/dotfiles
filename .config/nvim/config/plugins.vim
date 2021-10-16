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

" Better text manipulation
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Themes
Plug 'habamax/vim-habanight'
Plug 'gruvbox-community/gruvbox'

" statusline
Plug 'hoob3rt/lualine.nvim'

" telescope (better with `fd`)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" utilities
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/goyo.vim'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" pretty icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'hrsh7th/nvim-compe'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

call plug#end()
