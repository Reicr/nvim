-- Lua Language Server
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git'
  }
}
vim.lsp.enable('lua_ls')

-- Rust Language Server
vim.lsp.config['rust_ls'] = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = {
    'Cargo.toml',
    '.git'
  }
}
vim.lsp.enable('rust_ls')

-- Typescript Language Server
vim.lsp.config['typescript_ls'] = {
  cmd = {
    'typescript-language-server',
    '--stdio'
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      },
    },
  },
}
vim.lsp.enable('typescript_ls')

-- Tailwind Language Server
vim.lsp.config['tailwind_ls'] = {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  -- filetypes copied and adjusted from tailwindcss-intellisense
  filetypes = {
    -- html
    'html',
    -- css
    'css',
    'less',
    'postcss',
    'sass',
    'scss',
    -- js
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    -- mixed
    'svelte',
    'templ',
  },
  root_markers = { 'tailwind.config.js', 'postcss.config.js', '.git' },
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = {
        'class',
        'className'
      },
      includeLanguages = {
        templ = 'html',
        htmlangular = 'html'
      },
    },
  }
}
vim.lsp.enable('tailwind_ls')
