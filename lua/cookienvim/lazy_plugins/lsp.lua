-- See ./cookienvim/setup_langs.lua for LSP setup
return {
  'tpope/vim-sleuth',
  -- Language Server Setup
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'Decodetalkers/csharpls-extended-lsp.nvim',

      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      local servers = {
        clangd = {},
        csharp_ls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        powershell_es = {},
        pyright = {},
        rust_analyzer = {},
        sqlls = {},
        terraformls = {},
        tsserver = {},
        volar = {},
        yamlls = {},
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          if (server_name == "csharp_ls") then
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              settings = servers[server_name],
              handlers = {
                ["textDocument/definition"] = require('csharpls_extended').handler,
              },
            }
          else
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              settings = servers[server_name],
            }
          end
        end,
      }

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function() pcall(vim.lsp.buf.format({ async = false }), 'cnext') end,
      })
    end
  },
}
