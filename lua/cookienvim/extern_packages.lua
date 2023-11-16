--[[Setup and Install Lazy.nvim if it doesn't exist on the system]]
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

--[[Download external packages necessary for configuration]]
require('lazy').setup({
  --[[Basic Assistance]]
  'windwp/nvim-autopairs',
  'numToStr/Comment.nvim',
  'folke/which-key.nvim',
  'nvim-lua/plenary.nvim',

  --[[File Management]]
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-fzf-native.nvim',
  'nvim-telescope/telescope-project.nvim',
  'nvim-telescope/telescope-ui-select.nvim',

  --[[Git]]
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  --[[Language Assistance]]
  'neovim/nvim-lspconfig',
  'folke/neodev.nvim',
  -- Language Assistance: AutoCompletion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  -- Language Assistance: Debugging
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  -- Lanaguge Assistance: Linting and Formatting
  'mfussenegger/nvim-lint',
  'mhartington/formatter.nvim',
  -- Language Assistance: Builtin Installer
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- Language Assistance: Treesitter
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/nvim-treesitter-textobjects',

  --[[User Interface]]
  'f-person/auto-dark-mode.nvim',
  'catppuccin/nvim',
  'nvim-lualine/lualine.nvim',
})
