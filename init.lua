-- General editor setup
vim.cmd('set number') -- enable line numbers
vim.cmd('set tabstop=2') -- tab width
vim.cmd('set shiftwidth=2') -- indent width
vim.cmd('set expandtab') -- converts tabs to spaces

-- Setup package manager
-- Needs to happen before other plugins try to run there setup
require('packer')

-- Run plugin setup
require('git_signs')
require('lsp_installer')
require('lsp_saga')
require('lua_line')
require('null_ls')
require('nvim_cmp')
require('nvim_tree')
require('telescope')
require('treesitter')
require('which_key')

-- Load dracula theme
vim.cmd[[colorscheme dracula]]
