vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pl_packer.lua source <afile> | PackerCompile
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
  -- plugin for auto completion
  use 'hrsh7th/nvim-cmp'
  -- sources for nvim cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'ray-x/cmp-treesitter'
  use 'saadparwaiz1/cmp_luasnip'
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
  -- plugin that adds an improved fuzzy finder
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- plugin adds telescope integration for conventional commits
  use 'olacin/telescope-cc.nvim'
  -- plugin to show pretty diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }
  -- plugin offering a file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }
  -- plugin for command hints
  use 'folke/which-key.nvim'
  -- plugin for a status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- plugin for git commands
  use 'tpope/vim-fugitive'
  -- plugin to add git features
  use 'lewis6991/gitsigns.nvim'
  -- Dracula theme
  use 'Mofiqul/dracula.nvim'
  -- plugin to highlight the word under the cursor
  use 'yamatsum/nvim-cursorline'
  -- plugin offers an imroved commenting workflow
  use 'numToStr/Comment.nvim'
  -- plugin offers autocompletion for parantheses and quotes
  use 'windwp/nvim-autopairs'
  -- plugiin offers a buffer / tab line
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
  -- plugin for window selection
  use 'https://gitlab.com/yorickpeterse/nvim-window.git'
  -- plugin for motion enhancement
  use {
    'phaazon/hop.nvim',
    branch = 'v2'
  }
  -- plugin for managing package versions
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  })
end)
