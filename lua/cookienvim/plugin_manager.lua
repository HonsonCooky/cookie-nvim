--[[
Download external packages necessary for Neovim configuration.
Note: Nothing is being set up at this stage, as such, the order of downloads do not matter. I prefer this 1-layer-style
to package listing, to make it easier to read, but you must include dependencies.
]]

--[[Setup and Install Lazy.nvim if it doesn't exist on the system]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--[[List of external packages]]
require("lazy").setup({
  --[[Basic Assistance]]
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",
  "folke/which-key.nvim",

  --[[Dependancies]]
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  "3rd/image.nvim",
  "nvim-lua/plenary.nvim",

  --[[File Management]]
  "nvim-neo-tree/neo-tree.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-telescope/telescope-ui-select.nvim",

  --[[Git]]
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  --[[Language Assistance]]
  "neovim/nvim-lspconfig",
  "folke/neodev.nvim",
  -- Language Assistance: AutoCompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "rafamadriz/friendly-snippets",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  -- Language Assistance: Builtin Installer
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  -- Language Assistance: Debugging
  "mfussenegger/nvim-dap",
  "jay-babu/mason-nvim-dap.nvim",
  "rcarriga/nvim-dap-ui",
  -- Lanaguge Assistance: Linting and Formatting
  "jose-elias-alvarez/null-ls.nvim",
  "jay-babu/mason-null-ls.nvim",
  -- Language Assistance: Treesitter
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",

  --[[User Interface]]
  "f-person/auto-dark-mode.nvim",
  "catppuccin/nvim",
  "nvim-lualine/lualine.nvim",
  "arkav/lualine-lsp-progress",
  "akinsho/toggleterm.nvim",
})
