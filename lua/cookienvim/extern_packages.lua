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

-- External Packages, split by functionality
require('lazy').setup({
    -- Basic Assistance
    'ThePrimeagen/harpoon',
    'windwp/nvim-autopairs',
    'numToStr/Comment.nvim',
    'folke/which-key.nvim',
    'nvim-lua/plenary.nvim',

    -- Git
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- LSP Zero
    'VonHeikemen/lsp-zero.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-lint',
    'mhartington/formatter.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Neo-tree
    "nvim-neo-tree/neo-tree.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- Telescope
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',

    -- Themes
    'f-person/auto-dark-mode.nvim',
    'catppuccin/nvim',
})
