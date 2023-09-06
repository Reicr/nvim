-- General editor setup
vim.cmd('set shell=/bin/bash') -- use the bash shell for nvim
vim.cmd('set number relativenumber') -- enable hybrid line numbers
vim.cmd('set tabstop=2') -- tab width
vim.cmd('set shiftwidth=2') -- indent width
vim.cmd('set expandtab') -- converts tabs to spaces
vim.g.mapleader = ' ' -- use space as leader key

-- Setup package manager
-- Needs to happen before other plugins try to run there setup
require('pl_packer')

-- Load dracula theme
vim.cmd[[colorscheme dracula]]

-- Run plugin setup
require('pl_autopairs')
require('pl_bufferline')
require('pl_comment')
require('pl_git_signs')
require('pl_hop')
require('pl_lua_line')
require('pl_mason')
require('pl_nvim_cmp')
require('pl_nvim_tree')
require('pl_package_info')
require('pl_telescope')
require('pl_treesitter')
require('pl_trouble')
require('pl_which_key')
require('pl_window')
