local cmpnvimlsp_ok, cmpnvimlsp = pcall(require, 'cmp_nvim_lsp')
if not cmpnvimlsp_ok then
  return
end

local lspinstaller_ok, lspinstaller = pcall(require, 'nvim-lsp-installer')
if not lspinstaller_ok then
  return
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmpnvimlsp.update_capabilities(capabilities)

-- Include the servers you want to have installed by default below
local servers = {
  'cssls',
  'cssmodules_ls',
  'eslint',
  'graphql',
  'html',
  'jsonls',
  'sumneko_lua',
  'svelte',
  'tsserver',
  'vimls',
  'volar',
  'yamlls'
}

for _, name in pairs(servers) do
  local server_is_found, server = lspinstaller.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

-- Function to organize imports in typescript and javascript files
local function ts_organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lspinstaller.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities
    }

    -- (optional) Customize the options passed to the server
    if server.name == "tsserver" then
      opts.commands = {
        OrganizeImports = {
          ts_organize_imports,
          description = "Organize Imports"
        }
      }
    end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
