vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
  return
end

return packer.startup(function(use)
  -- packer plugin manager
  use 'wbthomason/packer.nvim'
  -- lsp config plugin for neovim
  use 'neovim/nvim-lspconfig'
  -- plugin to ease lsp installation
  use 'williamboman/nvim-lsp-installer'
  -- plugin to provide code related features like
  -- go to reference, go to definition, code actions, etc.
  use 'tami5/lspsaga.nvim'
  -- plugin to combine native lsp with other sources
  use 'jose-elias-alvarez/null-ls.nvim'
  -- plugin for auto completion
  use 'hrsh7th/nvim-cmp'
  -- sources for nvim cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- plugin for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- plugin file fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- plugin offering a file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  -- plugin for command hints
  use 'folke/which-key.nvim'
  -- plugin for a status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)
