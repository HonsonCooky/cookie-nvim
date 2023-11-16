--[[
    Setup language servers, auto completion engines, and treesitter implementations.
    This is possibly the most complicated file, as each language component can have it's
    own unique implementation.
]]


local mason_servers = {
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

require("neodev").setup()

-- Language Servers
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup()

cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete {},
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },

  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(mason_servers)
})
mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      settings = mason_servers[server_name],
    }
  end
})

-- Set up treesitter

local language_list = {
  "c",
  "cpp",
  "c_sharp",
  "javascript",
  "json",
  "lua",
  "markdown",
  "python",
  "rust",
  "sql",
  "terraform",
  "tsx",
  "typescript",
  "vimdoc",
  "vim",
  "yaml",
}


require("nvim-treesitter.configs").setup({
  autotag = { enable = true, },
  ensure_installed = language_list,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>ni",
      node_incremental = "<leader>nn",
      scope_incremental = "<leader>ns",
      node_decremental = "<leader>nd",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["<leader>aa"] = "@parameter.outer",
        ["<leader>ia"] = "@parameter.inner",
        ["<leader>af"] = "@function.outer",
        ["<leader>if"] = "@function.inner",
        ["<leader>ac"] = "@class.outer",
        ["<leader>ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["<leader>gns"] = "@function.outer",
        ["<leader>gno"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = { ["<leader>a"] = "@parameter.inner", },
      swap_previous = { ["<leader>A"] = "@parameter.inner", },
    },
  },
})

local ts = require("telescope.config")
local wk = require("which-key")
wk.register(
  {
    l = {
      name = "[L]SP",
      a = { vim.lsp.buf.code_action, "Code [A]ction" },
      f = { vim.lsp.buf.format, "[F]ormat" },
      r = { vim.lsp.buf.rename, "[R]ename" },
    },
  },
  { mode = "n", prefix = "<leader>" }
)


-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end
})
