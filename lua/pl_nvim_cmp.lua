local nvimcmp_ok, nvimcmp = pcall(require, 'cmp')
if not nvimcmp_ok then
  return
end

nvimcmp.setup {
  formatting = {
    format = function(entry, vim_item)
      -- Source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lsp_document_symbol = "[LSPDS]",
        nvim_lsp_signature_help = "[LSPSH]",
        treesitter = "[TS]",
        nvim_lua = "[LUA]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = {
    ['<C-n>'] = nvimcmp.mapping.select_next_item(),
    ['<C-p>'] = nvimcmp.mapping.select_prev_item(),
    ['<C-q>'] = nvimcmp.mapping.abort(),
    ['<C-c>'] = nvimcmp.mapping.complete(),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = nvimcmp.mapping.confirm({ select = true })
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'treesitter' },
  }
}
