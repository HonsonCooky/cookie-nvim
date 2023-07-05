local configuration = {}

return {
  "folke/which-key.nvim",
  config = function()
    local whichkey = require("which-key")
    whichkey.setup(configuration)
    whichkey.register({
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
    whichkey.register(
      {
        e = { function() vim.cmd("NvimTreeToggle") end, "File [E]xplorer" },
        l = {
          name = "[L]SP",
          a = { vim.lsp.buf.code_action, 'Code [A]ction' },
          d = { vim.lsp.buf.type_definition, 'Type [D]efinition' },
          r = { vim.lsp.buf.rename, '[R]ename' },
          s = { require('telescope.builtin').lsp_document_symbols, '[S]ymbols' }
        },
      },
      { mode = "n", prefix = "<leader>" }
    )
  end
}
