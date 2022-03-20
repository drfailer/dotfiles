"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               LSP MAPPINGS:                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mappings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').spell_suggest()<cr>
nnoremap <leader>fG <cmd>lua require('telescope.builtin').git_branches()<cr>

" custom fuzy finder
nnoremap <leader>vxx <cmd>lua require('telescope.builtin').find_files({ prompt_title = " >>= xmonad", cwd = "~/.xmonad/", })<cr>
nnoremap <leader>vrc <cmd>lua require('telescope.builtin').find_files({ prompt_title = "<NVIM>", cwd = "~/.config/nvim/", })<cr>
nnoremap <leader>vsc <cmd>lua require('telescope.builtin').find_files({ prompt_title = "<NVIM>", cwd = "~/.config/suckless-builds/", })<cr>
nnoremap <leader>wf <cmd>lua require('telescope.builtin').find_files({ prompt_title = "<NVIM>", cwd = "~/Documents/wiki/", })<cr>
nnoremap <leader>gsk <cmd>lua require('telescope.builtin').find_files({ prompt_title = "<NVIM>", cwd = "~/.config/suckless-builds/", })<cr>
