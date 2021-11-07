-------------------------------------------------------------------------------
--                          ██╗     ███████╗██████╗                          --
--                          ██║     ██╔════╝██╔══██╗                         --
--                          ██║     ███████╗██████╔╝                         --
--                          ██║     ╚════██║██╔═══╝                          --
--                          ███████╗███████║██║                              --
--                          ╚══════╝╚══════╝╚═╝                              --
-------------------------------------------------------------------------------

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>lvr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>lj', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>lsd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "clangd", "bashls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-------------------------------------------------------------------------------
-- BINDINGS:
-------------------------------------------------------------------------------
-- + See `:help vim.lsp.*` for documentation on any of the below functions
-- | key         | effect                        |
-- |:------------|:------------------------------|
-- | gd          | go to definition of function  |
-- | gD          | go to declaration of variable |
-- | K           | view documentation            |
-- | <leader>lr  | rename buf var                |
-- | <leader>la  | code actions                  |
-- | <leader>lf  | format code                   |
-- | <leader>lvr | view referencies              |
-- | <leader>lh  | signature help                |
-- | <leader>lD  | get type definition           |
-- | <leader>lk  | prev error                    |
-- | <leader>lj  | next error                    |
-- | <leader>ld  | show errors                   |
-- | <leader>lsd | show line errors              |
-- | <leader>lwa | add workspace folder          |
-- | <leader>lwr | remove workspace folder       |
-- | <leader>lwl | inspect workspace folder      |
-- | <leader>lI  | implementation                |
