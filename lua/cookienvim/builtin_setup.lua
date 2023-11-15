--[[GLOBAL]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.wo.number = true

--[[OPTIONS]]
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 100
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

--[[AUTOMATIONS]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = highlight_group,
    pattern = '*',
})
