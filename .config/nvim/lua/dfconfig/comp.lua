-------------------------------------------------------------------------------
--                                COMPLETION:                                --
-------------------------------------------------------------------------------

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({

  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },

  --mapping = {
  --  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  --  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --  -- ['<C-Space>'] = cmp.mapping.complete(),
  --  ['<C-e>'] = cmp.mapping.close(),
  --  ['<C-y>'] = cmp.mapping.confirm({ -- can be map on <CR>
  --      --behavior = cmp.ConfirmBehavior.Insert,
  --      select = true
  --  }),
  --},

  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },

  -- this require to have lspkind plugin
  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
        buffer = "[buff]",
        nvim_lsp = "[LSP]",
        vsnip = "[snip]",
        nvim_lua = "[lua]",
        -- latex_symbols = "[Latex]",
      })}),
  },

  sources = cmp.config.sources({
    -- { name = 'gh_issues' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer', keyword_length = 3 },
  })

})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}
