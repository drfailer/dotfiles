"           _   _   _
"  ___  ___| |_| |_(_)_ __   __ _ ___
" / __|/ _ \ __| __| | '_ \ / _` / __|
" \__ \  __/ |_| |_| | | | | (_| \__ \
" |___/\___|\__|\__|_|_| |_|\__, |___/
"                           |___/

" set leader key
let g:mapleader = "\<Space>"

syntax enable                 " Enables syntax highlighing
set exrc                      " Automatically source vimrc in projects directories
set hidden                    " Required to keep multiple buffers open multiple buffers
set number relativenumber     " Line numbers
set nowrap                    " Display long lines as just one line

set pumheight=10              " Makes popup menu smaller
set scrolloff=10              " To keep 10 lines between the cursor and the bottom of the screen
set encoding=utf-8            " The encoding displayed
set fileencoding=utf-8        " The encoding written to file

set guicursor=
set cursorline                " Enable highlighting of the current line
set ruler              		    " Show the cursor position all the time
set cmdheight=2               " More space for displaying messages

set iskeyword+=-            	" treat dash separated words as a word text object"
set mouse=a                   " Enable your mouse

set splitbelow                " Horizontal splits will automatically be below
set splitright                " Vertical splits will automatically be to the right

set t_Co=256                  " Support 256 colors
set conceallevel=0            " So that I can see `` in markdown files

set tabstop=2 softtabstop=2   " Insert 2 spaces for a tab
set shiftwidth=2              " Change the number of space characters inserted for indentation
set smarttab                  " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                 " Converts tabs to spaces
set smartindent               " Makes indenting smart
set autoindent                " Good auto indent

set background=dark           " tell vim what the background color looks like

set nobackup                  " This is recommended by coc
set nowritebackup             " This is recommended by coc
set noswapfile

set updatetime=300            " Faster completion
set timeoutlen=500            " By default timeoutlen is 1000 ms
set clipboard=unnamedplus     " Copy paste between vim and everything else

set nohlsearch                " Don't highlight when searching
set incsearch                 " Highlight when typing researche
"set autochdir                " Your working directory will always be the same as your working directory

" Finding file
set path+=**
set wildmode=longest,list,full

" completion setting
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" columns indicator
set colorcolumn=80
set signcolumn=yes

" Fix filetype
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.pde set filetype=java
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %

" removing whitespaces
fun! TrimWhitespaces()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
  autocmd!
  autocmd BufWritePre * :call TrimWhitespaces()
augroup END














