"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        ██╗   ██╗██╗███╗   ███╗      ██████╗ ██╗     ██╗   ██╗ ██████╗       "
"        ██║   ██║██║████╗ ████║      ██╔══██╗██║     ██║   ██║██╔════╝       "
"        ██║   ██║██║██╔████╔██║█████╗██████╔╝██║     ██║   ██║██║  ███╗      "
"        ╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔═══╝ ██║     ██║   ██║██║   ██║      "
"         ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ███████╗╚██████╔╝╚██████╔╝      "
"          ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Theme
Plug 'habamax/vim-habanight'
Plug 'metalelf0/base16-black-metal-scheme'
" ranger
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" fzf
" require to install fzf, ripgrep, universal-ctags, silversearcher-ag and
" fd-find
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'
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
" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

call plug#end()
