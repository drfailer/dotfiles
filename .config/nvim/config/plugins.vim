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
Plug 'ciaranm/inkpot'

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

call plug#end()
