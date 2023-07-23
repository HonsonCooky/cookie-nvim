return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting

        null_ls.setup({
            default_timeout = 10000,
            sources = {
                formatting.csharpier,     -- C#
                formatting.prettier,      -- TypeScript, React
                formatting.stylua,        -- Lua
                formatting.terraform_fmt, -- Terraform
                formatting.yamlfmt,       -- Yaml
            }
        })
    end
}
