vim.cmd('set number') -- enable line numbers
vim.cmd('set tabstop=2') -- tab width
vim.cmd('set shiftwidth=2') -- indent width
vim.cmd('set expandtab') -- converts tabs to spaces

require('plugins')

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  return
end

lspconfig.tsserver.setup {}

local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_ok then
  return
end

lspsaga.init_lsp_saga()

local nvimcmp_ok, nvimcmp = pcall(require, 'cmp')
if not nvimcmp_ok then
  return
end

nvimcmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'vsnip' },
    { name = 'buffer' }
  },
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  mapping = {
    ['<CR>'] = nvimcmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }
}

local treesittercfg_ok, treesittercfg = pcall(require, 'nvim-treesitter.configs')
if not treesittercfg_ok then
  return
end

treesittercfg.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}

local nvimtree_ok, nvimtree = pcall(require, 'nvim-tree')
if not nvimtree_ok then
  return
end

nvimtree.setup {}

local whichkey_ok, whichkey = pcall(require, 'which-key')
if not whichkey_ok then
  return
end

whichkey.setup {}
whichkey.register({
  f = {
    name = 'file',
    e = { '<cmd>NvimTreeToggle<cr>', 'File explorer' },
    f = { '<cmd>Telescope find_files<cr>', 'Find file' }
  },
  l = {
    name = 'LSP',
    i = { ':LspInfo<cr>', 'LSP Info' },
    K = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover commands' },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition' },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition' },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration' },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
    R = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
    a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions' },
    n = { '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', 'Go to next diagnostic' },
    p = { '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', 'Go to previous diagnostic' }
  },
  s = {
    name = 'LSP Saga',
    K = { '<cmd>Lspsaga hover_doc<cr>', 'Hover commands' },
    a = { '<cmd>Lspsaga code_action<cr>', 'Code actions' }
  }
})

local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
  return
end

lualine.setup {}
