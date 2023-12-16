--[[
Language Features, or 'intellisense', are the components that help speed up your typing and programming. Autocompletion,
Language Servers, Treesitters, and Debuggers. By default, this configuration ONLY makes sure that your setup can handle
Lua. As you encounter more and more programming languages, you can install more and more components when they become
necessary. Mason is included to enable in-situ language server support. This is not drastically different from VSCode
and other general purpose IDEs.
]]

require("nvim-autopairs").setup()
require("Comment").setup()
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

--[[AUTO COMPLETE]]
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")
local luasnip = require("luasnip")
luasnip.config.setup()

cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

--[[LSP]]
require("mason").setup()
require("mason-null-ls").setup({ handlers = {} })
require("null-ls").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = { "clangd", "lua_ls", "rust-analyzer", "vimls" },
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
})

--[[TREESITTER]]
require("nvim-treesitter.configs").setup({
  autotag = { enable = true },
  ensure_installed = { "c", "lua", "query", "rust", "vim", "vimdoc" },
  highlight = { enable = true },
  indent = { enable = true },
})

--[[DEBUGGING]]
require("dapui").setup()
require("mason-nvim-dap").setup()
local dap = require("dap")
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

--[[FORMAT ON SAVE]]
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
})
