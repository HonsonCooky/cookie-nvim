require("cookienvim.fonts").setup()

-- -----------------------------------------------------------------------------------------------------------------
-- GLOBALS
-- -----------------------------------------------------------------------------------------------------------------
local global = vim.g
local window = vim.wo

global.mapleader = " "
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

window.number = true -- Line numbers on by default

-- -----------------------------------------------------------------------------------------------------------------
-- OPTIONS
-- -----------------------------------------------------------------------------------------------------------------
local opts = vim.opt

-- Line numbers
opts.nu = true
opts.wrap = false
-- opts.rnu = true -- For Relative line numbers
opts.breakindent = true
opts.clipboard = 'unnamedplus'
opts.hlsearch = false
opts.ignorecase = true
opts.mouse = 'a'
opts.scrolloff = 12
opts.signcolumn = "yes"
opts.smartcase = true
opts.termguicolors = true
opts.timeout = true
opts.timeoutlen = 100
opts.updatetime = 250
opts.undofile = true
opts.expandtab = true
opts.tabstop = 2
opts.shiftwidth = 2
opts.smartindent = true

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

-- -----------------------------------------------------------------------------------------------------------------
-- PACKAGE MANAGER "Lazy"
-- -----------------------------------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Setup with files in lazy_plugins folder
require("lazy").setup("cookienvim.lazy_plugins")

-- -----------------------------------------------------------------------------------------------------------------
-- GO TO OUR SOURCE REPO
-- -----------------------------------------------------------------------------------------------------------------
local source_repo_loc = os.getenv("UserProfile") .. "/source"
vim.cmd("cd " .. source_repo_loc)
