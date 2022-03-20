"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 SETTINGS:                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable                 " Enables syntax highlighing
set exrc                      " Automatically source vimrc in projects directories
set hidden                    " Required to keep multiple buffers open multiple buffers
set number relativenumber     " Line numbers
set nowrap                    " Display long lines as just one line
set pumheight=10              " Makes popup menu smaller
set encoding=utf-8            " The encoding displayed
set fileencoding=utf-8        " The encoding written to file
set t_Co=256
set guicursor=
set cursorline                " Enable highlighting of the current line
set ruler                     " Show the cursor position all the time
" set noruler                 " Show the cursor position all the time
set go=a
set cmdheight=2               " More space for displaying messages
set iskeyword+=-                " treat dash separated words as a word text object"
set mouse=a                   " Enable your mouse
set splitbelow                " Horizontal splits will automatically be below
set splitright                " Vertical splits will automatically be to the right
set conceallevel=0            " So that I can see `` in markdown files
set tabstop=2 softtabstop=2   " Insert 2 spaces for a tab
set shiftwidth=2              " Change the number of space characters inserted for indentation
set smarttab                  " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                 " Converts tabs to spaces
set smartindent               " Makes indenting smart
set autoindent                " Good auto indent
set nobackup                  " This is recommended by coc
set nowritebackup             " This is recommended by coc
set noswapfile
set updatetime=300            " Faster completion
set timeoutlen=500            " By default timeoutlen is 1000 ms
set completeopt=menu,menuone,noinsert,noselect " test
set clipboard=unnamedplus     " Copy paste between vim and everything else
set nohlsearch                " Don't highlight when searching
set incsearch                 " Highlight when typing researche
set path+=**
set wildmode=longest,list,full
set colorcolumn=80            " columns indicator
set signcolumn=no
set scrolloff=0
set sidescrolloff=0
set noshowmode
set foldmethod=marker
set guifont=Inconsolata\ for\ Powerline:h11

" remove netrw banner:
let g:netrw_banner=0
