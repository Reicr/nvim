local cmpnvimlsp_ok, cmpnvimlsp = pcall(require, 'cmp_nvim_lsp')
if not cmpnvimlsp_ok then
  return
end

local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

local mason_lsp_config_ok, mason_lsp_config = pcall(require, 'mason-lspconfig')
if not mason_lsp_config_ok then
  return
end

local lsp_config_ok, lsp_config = pcall(require, 'lspconfig')
if not lsp_config_ok then
  return
end

mason.setup()
mason_lsp_config.setup({
  ensure_installed = {
    'cssls',
    'cssmodules_ls',
    'eslint',
    'graphql',
    'html',
    'jedi_language_server',
    'jsonls',
    'lua_ls',
    'marksman',
    'rust_analyzer',
    'svelte',
    'tsserver',
    'vimls',
    'volar',
    'yamlls'
  }
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmpnvimlsp.default_capabilities(capabilities)

mason_lsp_config.setup_handlers {
  function(server)
    lsp_config[server].setup {
      capabilities = capabilities,
    }
  end,

  ['lua_ls'] = function()
    lsp_config['lua_ls'].setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim'
            }
          }
        }
      }
    }
  end,

  ['tsserver'] = function()
    -- Function to organize imports in typescript and javascript files
    local function ts_organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
      }
      vim.lsp.buf.execute_command(params)
    end

    lsp_config['tsserver'].setup {
      capabilities = capabilities,
      commands = {
        OrganizeImports = {
          ts_organize_imports,
          description = "Organize Imports"
        }
      }
    }
  end,

  ['volar'] = function()
    lsp_config['volar'].setup {
      capabilities = capabilities,
      init_options = {
        typescript = {
          tsdk = '/Users/r.heinrich/.volta/tools/image/packages/typescript/lib/node_modules/typescript/lib'
        }
      }
    }
  end,

  ['yamlls'] = function()
    lsp_config['yamlls'].setup {
      capabilities = capabilities,
      settings = {
        yaml = {
          completion = { enable = true },
          customTags = {
            "!Equals sequence",
            "!FindInMap sequence",
            "!GetAtt",
            "!If sequence",
            "!Join sequence",
            "!Ref",
            "!Sub",
            "!Sub sequence"
          },
          validate = { enable = true },
        }
      }
    }
  end
}
