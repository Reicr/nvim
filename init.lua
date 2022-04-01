-- General editor setup
vim.cmd('set number') -- enable line numbers
vim.cmd('set tabstop=2') -- tab width
vim.cmd('set shiftwidth=2') -- indent width
vim.cmd('set expandtab') -- converts tabs to spaces

-- Setup package manager
-- Needs to happen before other plugins try to run there setup
require('pl_packer')

-- Run plugin setup
require('pl_git_signs')
require('pl_lsp_installer')
require('pl_lsp_saga')
require('pl_lua_line')
require('pl_null_ls')
require('pl_nvim_cmp')
require('pl_nvim_tree')
require('pl_telescope')
require('pl_treesitter')
require('pl_which_key')

-- Load dracula theme
vim.cmd[[colorscheme dracula]]
