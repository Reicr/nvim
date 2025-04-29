-- General editor setup
vim.cmd("set cursorline")            -- highlight row of cursor
vim.cmd("set expandtab")             -- converts tabs to spaces
vim.cmd("set ignorecase")            -- case insensitive search
vim.cmd("set number relativenumber") -- enable hybrid line numbers
vim.cmd("set scrolloff=10")          -- Do not let cursor scroll below or above N number of lines when scrolling
vim.cmd("set shell=/bin/bash")       -- use the bash shell for nvim
vim.cmd("set shiftwidth=2")          -- indent width
vim.cmd("set sidescrolloff=10")      -- Do not let cursor scroll below or above N number of lines when scrolling
vim.cmd("set tabstop=2")             -- tab width

vim.g.mapleader = " "                -- use space as leader key

-- Setup package manager
-- Needs to happen before other plugins try to run there setup
require("pl_lazy")

-- Setup LSP configurations
require("lsp_config")

-- Setup user commands
require("user_commands")
