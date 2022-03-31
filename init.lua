vim.cmd('set number') -- enable line numbers
vim.cmd('set tabstop=2') -- tab width
vim.cmd('set shiftwidth=2') -- indent width
vim.cmd('set expandtab') -- converts tabs to spaces

require('plugins')

-- Load dracula theme
vim.cmd[[colorscheme dracula]]
-- use transparent background
vim.g.dracula_transparent_bg = true
vim.g.dracula_italic_comment = false

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

local cmpnvimlsp_ok, cmpnvimlsp = pcall(require, 'cmp_nvim_lsp')
if not cmpnvimlsp_ok then
  return
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmpnvimlsp.update_capabilities(capabilities)

local lspinstaller_ok, lspinstaller = pcall(require, 'nvim-lsp-installer')
if not lspinstaller_ok then
  return
end

-- Include the servers you want to have installed by default below
local servers = {
  'cssls',
  'cssmodules_ls',
  'graphql',
  'html',
  'tsserver'
}

for _, name in pairs(servers) do
  local server_is_found, server = lspinstaller.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lspinstaller.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_ok then
  return
end

lspsaga.init_lsp_saga()

local nullls_ok, nullls = pcall(require, 'null-ls')
if not nullls_ok then
  return
end

nullls.setup {
  sources = {
    nullls.builtins.code_actions.gitsigns,
    nullls.builtins.completion.vsnip,
    nullls.builtins.diagnostics.eslint,
    nullls.builtins.formatting.prettier
  }
}

local treesittercfg_ok, treesittercfg = pcall(require, 'nvim-treesitter.configs')
if not treesittercfg_ok then
  return
end

treesittercfg.setup {
  ensure_installed = {
    'css',
    'graphql',
    'html',
    'javascript',
    'typescript'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}

local nvimtree_ok, nvimtree = pcall(require, 'nvim-tree')
if not nvimtree_ok then
  return
end

nvimtree.setup {
  highlight_opened_files = 3,
  update_focused_file = {
    enable = true
  },
  view = {
    width = 60
  }
}

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
  s = {
    name = 'LSP Saga',
    a = { '<cmd>Lspsaga code_action<cr>', 'Code actions' },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition' },
    f = { ':Lspsaga lsp_finder<cr>', 'Finder'},
    i = { ':LspInfo<cr>', 'LSP Info' },
    j = { ':Lspsaga diagnostic_jump_next<cr>', 'Go to next diagnostic'},
    k = { ':Lspsaga diagnostic_jump_prev<cr>', 'Go to previous diagnostic'},
    p = { ':Lspsaga preview_definition<cr>', 'Preview definition'},
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
    s = { ':Lspsaga signature_help<cr>', 'Signature help'},
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition' },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration' },
    K = { ':Lspsaga hover_doc<cr>', 'Hover commands' },
    R = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
  }
})

local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
  return
end

lualine.setup {}

local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_ok then
  return
end

gitsigns.setup()

local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      'build[\\/]',
      '%.git[\\/]',
      '%.next[\\/]',
      'node_modules'
    }
  }
}
