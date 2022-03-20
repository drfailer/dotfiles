"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               LSP MAPPINGS:                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <space>le :lua vim.diagnostic.open_float()<CR>
nnoremap <space>lp :lua vim.diagnostic.goto_prev()<CR>
nnoremap <space>ln :lua vim.diagnostic.goto_next()<CR>
nnoremap <space>lq :lua vim.diagnostic.setloclist()<CR>

nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>

nnoremap <space>li :lua vim.lsp.buf.hover()<CR>
nnoremap <space>lh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>lD :lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>lr :lua vim.lsp.buf.rename()<CR>
nnoremap <space>la :lua vim.lsp.buf.code_action()<CR>
nnoremap <space>lf :lua vim.lsp.buf.formatting()<CR>
nnoremap <space>lwa :lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <space>lwr :lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <space>lwl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
