local configuration = {}

return {
  "folke/which-key.nvim",
  config = function()
    local whichkey = require("which-key")
    local telescope = require("telescope.builtin")
    whichkey.setup(configuration)
    -- --------------------------------------------------------
    -- NORMAL MODE
    -- --------------------------------------------------------
    -- Non-Silent
    whichkey.register({
        [";"] = { ":", "Vim commandline" },
        -- ["<esc>"] = { "<esc>:noh<cr>", "Remove Highlighting" },
      },
      { mode = "n", silent = false }
    )
    -- Silent
    whichkey.register({
        ["<C-`>"] = { function() vim.cmd("ToggleTerm direction=horizontal") end, "Open Terminal" },
        ["<C-a>"] = { "ggVG", "Highlight [A]ll" },
        ["<C-h>"] = { "<C-w>h", "Jump to windows LEFT" },
        ["<C-j>"] = { "<C-w>j", "Jump to windows DOWN" },
        ["<C-k>"] = { "<C-w>k", "Jump to windows UP" },
        ["<C-l>"] = { "<C-w>l", "Jump to windows RIGHT" },
        ["<TAB>"] = { function() vim.cmd("tabnext") end, "Next Tab" },
        ["<S-TAB>"] = { function() vim.cmd("tabprev") end, "Prev Tab" },
        J = { "mzJ`z", "Pull line up, stay position" },
        g = {
          name = "[G]oTo",
          d = { vim.lsp.buf.definition, '[D]efinition' },
          D = { vim.lsp.buf.declaration, '[D]eclaration' },
          r = { require('telescope.builtin').lsp_references, '[R]eferences' },
          i = { vim.lsp.buf.implementation, '[I]mplementation' },
        },
        H = { vim.lsp.buf.signature_help, 'Signature [H]elp' },
        K = { vim.lsp.buf.hover, 'Hover Documentation' },
        w = {
          name = "[W]orkspace",
          a = { vim.lsp.buf.add_workspace_folder, '[A]dd Folder' },
          l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[L]ist Folders' },
          r = { vim.lsp.buf.remove_workspace_folder, '[R]emove Folder' },
          s = { require('telescope.builtin').lsp_dynamic_workspace_symbols, '[S]ymbols' },
        }
      },
      { mode = "n" }
    )
    -- Leader prefixed
    whichkey.register(
      {
        d = {
          name = "[D]iagnostics",
          f = { vim.diagnostic.open_float, "[F]loat" },
          n = { vim.diagnostic.goto_next, "[N]ext" },
          p = { vim.diagnostic.goto_prev, "[P]revious" },
        },
        e = { function() vim.cmd("NeoTreeFloat") end, "File [E]xplorer" },
        f = {
          name = "[F]ind",
          ["/"] = { telescope.oldfiles, "History" },
          b = { telescope.buffers, "[B]uffers" },
          d = { telescope.diagnostics, "[D]iagnostics" },
          f = { telescope.find_files, "[F]ind Files" },
          g = { telescope.git_files, "[G]it Files" },
          h = { telescope.help_tags, "[H]elp" },
          s = { telescope.live_grep, "Text [S]earch" },
          w = { telescope.grep_string, "Word [S]earch" },
        },
        g = {
          name = "[G]it hunk",
          -- see cookienvim.git.lua
        },
        l = {
          name = "[L]SP",
          a = { vim.lsp.buf.code_action, 'Code [A]ction' },
          d = { vim.lsp.buf.type_definition, 'Type [D]efinition' },
          r = { vim.lsp.buf.rename, '[R]ename' },
          s = { require('telescope.builtin').lsp_document_symbols, '[S]ymbols' }
        },
        w = {
          function()
            vim.lsp.buf.format { async = false }
            vim.cmd("wa")
          end,
          "[W]rite"
        }
      },
      { mode = "n", prefix = "<leader>" }
    )
    -- --------------------------------------------------------
    -- VISUAL MODE
    -- --------------------------------------------------------
    whichkey.register({
        J = { ":m '>+1<CR>gv=gv", "Move line down" },
        K = { ":m '<-2<CR>gv=gv", "Move line up" },
      },
      { mode = "v" }
    )
  end
}
