local configuration = {}

-- ----------------------------------------------------------------------------------
-- MODES:
-- insert_mode = "i",
-- normal_mode = "n",
-- term_mode = "t",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- command_mode = "c",
-- operator_pending_mode = "o",
-- ----------------------------------------------------------------------------------

return {
  "folke/which-key.nvim",
  dependencies = {
    "ThePrimeagen/harpoon",
    "nvim-telescope/telescope.nvim",
    'akinsho/toggleterm.nvim',
  },
  config = function()
    local whichkey = require("which-key")
    local telescope = require("telescope.builtin")
    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")
    local fonts = require("cookienvim.fonts")
    local utils = require("cookienvim.utilmods")

    local lazygit = require('toggleterm.Terminal').Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float"
    })

    whichkey.setup(configuration)
    -- --------------------------------------------------------
    -- NORMAL MODE
    -- --------------------------------------------------------
    -- Non-Silent
    whichkey.register({
        [";"] = { ":", "Vim Command" }, -- Just makes life a little easier
      },
      { mode = "n", silent = false })
    -- Silent
    whichkey.register({
        -- Terminal
        ["<C-`>"] = { function() vim.cmd("ToggleTerm direction=horizontal") end, "Open Terminal" },
        -- Navigation
        ["<C-a>"] = { "ggVG", "Highlight [A]ll" },
        ["<C-h>"] = { "<C-w>h", "Jump To Windows LEFT" },
        ["<C-j>"] = { "<C-w>j", "Jump To Windows DOWN" },
        ["<C-k>"] = { "<C-w>k", "Jump To Windows UP" },
        ["<C-l>"] = { "<C-w>l", "Jump To Windows RIGHT" },
        ["<TAB>"] = { function() vim.cmd("tabnext") end, "Next Tab" },
        ["<S-TAB>"] = { function() vim.cmd("tabprev") end, "Prev Tab" },
        -- Window manipulations
        ["<C-.>"] = { fonts.font_increase, "Increase Font Size" },
        ["<C-,>"] = { fonts.font_decrease, "Decrease Font Size" },
        ["<C-Up>"] = { ":resize +2<CR>", "Window Increase Height" },
        ["<C-Down>"] = { ":resize -2<CR>", "Window Decrease Height" },
        ["<C-Left>"] = { ":vertical resize -2<CR>", "Window Decrease Width" },
        ["<C-Right>"] = { ":vertical resize +2<CR>", "Window Increase Width" },
        -- Text manipulations
        ["<A-j>"] = { ":m .+1<CR>==", "Move Line Up" },
        ["<A-k>"] = { ":m .-2<CR>==", "Move Line Down" },
        J = { "mzJ`z", "Fancy Line Pull" },
        -- Harpoon Navigation
        ["<A-f>"] = { function() harpoon_ui.nav_file(vim.v.count) end, "Harpoon Navigate To [F]ile" },
        ["<A-d>"] = { function() harpoon_ui.nav_next() end, "Harpoon Navigate Next" },
        ["<A-s>"] = { function() harpoon_ui.nav_prev() end, "Harpoon Navigate Prev" },
        -- LSP Shortcuts
        g = {
          name = "[G]oTo",
          d = { vim.lsp.buf.definition, '[D]efinition' },
          D = { vim.lsp.buf.declaration, '[D]eclaration' },
          r = { telescope.lsp_references, '[R]eferences' },
          i = { vim.lsp.buf.implementation, '[I]mplementation' },
        },
        H = { vim.lsp.buf.signature_help, 'Signature [H]elp' },
        K = { vim.lsp.buf.hover, 'Hover Documentation' },
        -- Workspace Shortcuts
        w = {
          name = "[W]orkspace",
          a = { vim.lsp.buf.add_workspace_folder, '[A]dd Folder' },
          l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[L]ist Folders' },
          r = { vim.lsp.buf.remove_workspace_folder, '[R]emove Folder' },
          s = { telescope.lsp_dynamic_workspace_symbols, '[S]ymbols' },
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
        e = { function() vim.cmd("Neotree position=right") end, "File [E]xplorer" },
        f = {
          name = "[F]ind",
          ["/"] = { telescope.oldfiles, "History" },
          b = { telescope.buffers, "[B]uffers" },
          d = { telescope.diagnostics, "[D]iagnostics" },
          f = { telescope.find_files, "[F]iles" },
          g = { telescope.git_files, "[G]it" },
          h = { telescope.help_tags, "[H]elp" },
          t = { telescope.live_grep, "[T]ext" },
          w = { telescope.grep_string, "[W]ord" },
        },
        g = {
          name = "[G]it",
          -- see cookienvim.git.lua
          g = { function() lazygit:toggle() end, "Lazy[G]it" },
          p = { require('gitsigns').prev_hunk, "[P]revious Hunk" },
          n = { require('gitsigns').next_hunk, "[N]ext Hunk" },
          h = { require('gitsigns').preview_hunk, "Preview [H]unk" },
        },
        h = {
          name = "[H]arpoon",
          a = { harpoon_mark.add_file, "[A]dd" },
          f = { harpoon_ui.toggle_quick_menu, "[F]iles" },
        },
        l = {
          name = "[L]SP",
          a = { vim.lsp.buf.code_action, 'Code [A]ction' },
          d = { vim.lsp.buf.type_definition, 'Type [D]efinition' },
          f = { vim.lsp.buf.format, '[F]ormat' },
          r = { vim.lsp.buf.rename, '[R]ename' },
          s = { telescope.lsp_document_symbols, '[S]ymbols' }
        },
        q = { utils.safe_quit, '[Q]uit' },
        r = { utils.reload_buffer, '[R]eload Buffer' },
        t = {
          name = "[T]heme",
          a = { require("cookienvim.thememod").theme_handle, "[A]lign" },
          d = { function() require("cookienvim.thememod").theme_handle(true) end, "[D]ark" },
          l = { function() require("cookienvim.thememod").theme_handle(false) end, "[L]ight" },
          t = { function() vim.cmd("Telescope colorscheme") end, "[T]elescope" },
        },
        w = { utils.format_and_save, "[W]rite All" }
      },
      { mode = "n", prefix = "<leader>" }
    )
    -- --------------------------------------------------------
    -- VISUAL MODE
    -- --------------------------------------------------------
    whichkey.register({
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move Line Down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move Line Up" },
        ["<"] = { "<gv", "Indent Decrease" },
        [">"] = { ">gv", "Indent Increase" }
      },
      { mode = "v" }
    )
    -- --------------------------------------------------------
    -- TERMINAL MODE
    -- --------------------------------------------------------
    whichkey.register({
        ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Jump To Windows LEFT" },
        ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Jump To Windows DOWN" },
        ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Jump To Windows UP" },
        ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Jump To Windows RIGHT" },
      },
      { mode = "t" }
    )
  end
}
