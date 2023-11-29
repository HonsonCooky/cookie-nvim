local whichkey = require("which-key")
local telescope_builtin = require("telescope.builtin")

whichkey.setup()

--[[NORMAL MODE]]
whichkey.register({
    -- Terminal
    ["<C-t>"] = { ":ToggleTerm direction=horizontal<CR>", "Open Terminal" },
    ["<C-`>"] = { NewTerminal, "Open Terminal" },

    -- Navigation
    ["<C-h>"] = { "<C-w>h", "Jump To Windows LEFT" },
    ["<C-j>"] = { "<C-w>j", "Jump To Windows DOWN" },
    ["<C-k>"] = { "<C-w>k", "Jump To Windows UP" },
    ["<C-l>"] = { "<C-w>l", "Jump To Windows RIGHT" },

    -- Window manipulations
    ["<C-Up>"] = { ":resize +2<CR>", "Window Increase Height" },
    ["<C-Down>"] = { ":resize -2<CR>", "Window Decrease Height" },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Window Decrease Width" },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "Window Increase Width" },

    -- Text manipulations
    ["<A-j>"] = { ":m .+1<CR>==", "Move Line Up" },
    ["<A-k>"] = { ":m .-2<CR>==", "Move Line Down" },
    J = { "mzJ`z", "Fancy Line Pull" },

    -- UI Manipulations
    ["<C-.>"] = { Font_Increase, "Increase Font Size" },
    ["<C-,>"] = { Font_Decrease, "Decrease Font Size" },
    ["<leader>u"] = {
      name = "[U]ser Interface",
      s = { Toggle_Spell_Check, "Toggle [S]pell Check" },
      w = { Toggle_Wrap, "Toggle Text [W]rap" },
    },

    -- Buffer Manipulations
    ["<leader>w"] = { ":wa<CR>", "[W]rite All" },

    -- File Management
    ["<leader>e"] = { ":Neotree source=filesystem toggle=true position=right reveal=true<CR>", "File [E]xplorer" },
    ["<leader>f"] = {
      name = "[F]ind",
      b = { telescope_builtin.buffers, "[B]uffers" },
      d = { telescope_builtin.diagnostics, "[D]iagnostics" },
      f = { telescope_builtin.find_files, "[F]iles" },
      g = { telescope_builtin.git_files, "[G]it" },
      h = { telescope_builtin.help_tags, "[H]elp" },
      j = { telescope_builtin.oldfiles, "History" },
      t = { telescope_builtin.live_grep, "[T]ext" },
      w = { telescope_builtin.grep_string, "[W]ord" },
    },
    ["<leader>n"] = {
      name = "[N]eo Tree",
      b = { ":Neotree source=buffers toggle=true position=right reveal=true<CR>", "[B]uffer Explorer" },
      g = { ":Neotree source=git_status toggle=true position=right reveal=true<CR>", "[G]it Status" },
      l = { ":Neotree source=last toggle=true position=right reveal=true<CR>", "[L]ast Source" },
    },

    -- Language Assistance
    K = { vim.lsp.buf.hover, "Hover" },
    ["<leader>l"] = {
      name = "[L]SP",
      a = { vim.lsp.buf.code_action, 'Code [A]ction' },
      f = { vim.lsp.buf.format, '[F]ormat' },
      r = { vim.lsp.buf.rename, '[R]ename' },
    },
    g = {
      name = "[G]oto",
      d = {
        name = "[D]iagnostic",
        f = { vim.diagnostic.open_float, "[F]loat" },
        j = { vim.diagnostic.goto_next, "Next" },
        k = { vim.diagnostic.goto_prev, "Previous" },
      },
      l = {
        name = "[L]sp",
        d = { telescope_builtin.lsp_definitions, '[D]efinition' },
        i = { telescope_builtin.lsp_implementations, '[I]mplementation' },
        r = { telescope_builtin.lsp_references, '[R]eferences' },
        s = { telescope_builtin.lsp_document_symbols, '[S]ymbols' },
        t = { telescope_builtin.lsp_type_definitions, '[T]ype Definition' },
      }
    },
  },
  { mode = "n", noremap = true }
)

--[[VISUAL MODE]]
whichkey.register({
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move Line Down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move Line Up" },
  },
  { mode = "v", noremap = true }
)

--[[TERMINAL MODE]]
whichkey.register({
    ["<C-t>"] = { "<C-\\><C-N>", "Exit Insert" },
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Jump To Windows LEFT" },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Jump To Windows DOWN" },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Jump To Windows UP" },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Jump To Windows RIGHT" },
  },
  { mode = "t", noremap = true }
)
