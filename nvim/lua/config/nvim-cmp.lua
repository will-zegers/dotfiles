local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('clangd', {
  capabilities = capabilities
})
vim.lsp.enable('clangd')
vim.lsp.config('zls', {
  capabilities = capabilities
})
vim.lsp.enable('zls')
vim.lsp.config('rust_analyzer', {
  capabilities = capabilities
})
vim.lsp.enable('rust_analyzer')
vim.lsp.config('lua_ls', {
  capabilities = capabilities
})
vim.lsp.enable('lua_ls')
