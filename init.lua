-- General editor setup
vim.cmd('set shell=/bin/bash') -- use the bash shell for nvim
vim.cmd('set number relativenumber') -- enable hybrid line numbers
vim.cmd('set tabstop=2') -- tab width
vim.cmd('set shiftwidth=2') -- indent width
vim.cmd('set expandtab') -- converts tabs to spaces
vim.g.mapleader = ' ' -- use space as leader key

-- Setup package manager
-- Needs to happen before other plugins try to run there setup
require('pl_lazy')
