--[[
    Initialize Vim defaults
]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--[[
    Install necessary packages
]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Basic Assistance
    { 'ThePrimeagen/harpoon' },
    { 'windwp/nvim-autopairs' },
    { 'numToStr/Comment.nvim' },

    -- Git
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },

    -- LSP Zero
    { 'VonHeikemen/lsp-zero.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Telescope
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim' },

    -- Themes
    { 'f-person/auto-dark-mode.nvim' },
    { 'catppuccin/nvim' },
})

--[[
    Orchestrate the initialization of each package
]]
require("cookienvim.theme")
