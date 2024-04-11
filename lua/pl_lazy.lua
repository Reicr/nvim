local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_ok, lazy = pcall(require, 'lazy')
if not lazy_ok then
  return
end

local plugins = {
  -- color scheme
  {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme dracula]]
    end
  },
  -- lsp config plugin for neovim
  'neovim/nvim-lspconfig',
  -- plugin to ease lsp installation
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- plugin for auto completion
  'hrsh7th/nvim-cmp',
  -- sources for nvim cmp
  -- use 'hrsh7th/cmp-buffer'
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-path',
  'L3MON4D3/LuaSnip',
  'ray-x/cmp-treesitter',
  'saadparwaiz1/cmp_luasnip',
  -- plugin for syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  -- plugin file fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  -- plugin that adds an improved fuzzy finder
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- plugin adds telescope integration for conventional commits
  'olacin/telescope-cc.nvim',
  -- plugin to show pretty diagnostics
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons"
  },
  -- plugin offering a file explorer
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    }
  },
  -- plugin for command hints
  'folke/which-key.nvim',
  -- plugin for a status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },
  -- plugin for git commands
  'tpope/vim-fugitive',
  -- plugin to add git features
  'lewis6991/gitsigns.nvim',
  -- Dracula theme
  'Mofiqul/dracula.nvim',
  -- plugin to highlight the word under the cursor
  'yamatsum/nvim-cursorline',
  -- plugin offers an imroved commenting workflow
  'numToStr/Comment.nvim',
  -- plugin offers autocompletion for parantheses and quotes
  'windwp/nvim-autopairs',
  -- plugiin offers a buffer / tab line
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'kyazdani42/nvim-web-devicons'},
  -- plugin for window selection
  'https://gitlab.com/yorickpeterse/nvim-window.git',
  -- plugin for motion enhancement
  {
    'phaazon/hop.nvim',
    branch = 'v2'
  },
  -- plugin for managing package versions
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  }
}

local opts = {}

lazy.setup(plugins, opts)
