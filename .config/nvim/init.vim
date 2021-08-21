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
source $HOME/.config/nvim/themes/dark.vim
" source $HOME/.config/nvim/themes/metal.vim
source $HOME/.config/nvim/themes/airline.vim

" some plugins
source $HOME/.config/nvim/plug-config/vim/rnvimr.vim
" source $HOME/.config/nvim/plug-config/fzf.vim
source /home/drfailer/.config/nvim/plug-config/vim/telescope.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/plug-config/vim/floaterm.vim
source $HOME/.config/nvim/plug-config/vim/snippet.vim

" lsp and completion
source $HOME/.config/nvim/plug-config/lua/lsp.lua
source $HOME/.config/nvim/plug-config/lua/lsp-servers.lua
source $HOME/.config/nvim/plug-config/vim/nvim-completion.vim
source $HOME/.config/nvim/plug-config/lua/telescope.lua

" treesitter config
source $HOME/.config/nvim/plug-config/lua/treesitter.lua
