--[[
    Setup language servers, auto completion engines, and treesitter implementations.
    This is possibly the most complicated file, as each language component can have it's
    own unique implementation.

    Setups are split on
]]

-- Load the plugins
local lspconfig = require('lspconfig')
local treesitter = require('nvim-treesitter.configs')

-- Set up the LSP client for Rust
lspconfig.rust_analyzer.setup {}

-- Set up the LSP client for C++
lspconfig.clangd.setup {}

-- Set up the LSP client for TypeScript
lspconfig.tsserver.setup {}

-- Set up the LSP client for C#
lspconfig.omnisharp.setup {}

-- Set up nvim-treesitter
treesitter.setup {
    ensure_installed = {
        "rust",
        "cpp",
        "typescript",
        "c_sharp"
    },
    highlight = {
        enable = true
    }
}

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = vim.lsp.buf.format
})
