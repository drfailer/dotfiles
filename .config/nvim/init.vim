"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗              "
"               ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║              "
"               ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║              "
"               ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║              "
"               ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║              "
"               ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug
source $HOME/.config/nvim/vim-plug/plugins.vim

" general settings
source $HOME/.config/nvim/general/settings.vim

" mappings
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/compileScript.vim

" themes
" source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/dark.vim
" source $HOME/.config/nvim/themes/metal.vim
source $HOME/.config/nvim/themes/airline.vim

" some plugins
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/snippet.vim

" lsp and completion
source $HOME/.config/nvim/plug-config/lsp.lua
source $HOME/.config/nvim/plug-config/lsp-servers.lua
source $HOME/.config/nvim/plug-config/nvim-completion.vim

" treesitter config
source $HOME/.config/nvim/plug-config/treesitter.lua
