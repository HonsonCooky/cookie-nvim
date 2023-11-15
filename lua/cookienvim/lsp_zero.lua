local servers = {
    clangd = {},
    cmake = {
        buildDirectory = "out\build"
    },
    csharp_ls = {},
    eslint = {},
    html = {},
    lua_ls = {},
    powershell_es = {},
    prismals = {},
    pyright = {},
    rust_analyzer = {},
    sqlls = {},
    tailwindcss = {},
    terraformls = {},
    tsserver = {},
    volar = {},
    yamlls = {},
}

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = vim.tbl_keys(servers),
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})


-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = vim.lsp.buf.format
})
