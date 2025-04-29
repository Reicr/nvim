return {
  -- color scheme
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-frappe"
    end,
  },
  -- plugin for LSP management
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  -- plugin for auto completion
  {
    "saghen/blink.cmp",
    version = '1.*',
    opts = {
      appearance = {
        nerd_font_variant = 'normal'
      }
    }
  },
  -- plugin for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local cfg = require("nvim-treesitter.configs")

      cfg.setup({
        ensure_installed = {
          "css",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "scss",
          "svelte",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
      })
    end,
  },
  -- plugin file fuzzy finding
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },
  -- plugin to show pretty diagnostics
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  -- plugin for a status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    opts = {
      sections = {
        lualine_c = {
          {
            "filename",

            -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory
            path = 1,

            -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            shorting_target = 40,
          },
        },
      },
    },
  },
  -- plugin to add git features
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  -- plugin offers an imroved commenting workflow
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  -- plugin to highlight patterns in text
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    version = false,
  },
  -- plugin for a quick switch list of marked files
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
