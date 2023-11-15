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

local gitsigns = require('gitsigns')
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local telescope_builtin = require("telescope.builtin")
local whichkey = require("which-key")

whichkey.setup(configuration)

whichkey.register({
        -- Terminal
        ["<C-`>"] = { function() vim.cmd("") end, "Open Terminal" },

        -- Navigation
        ["<C-h>"] = { "<C-w>h", "Jump To Windows LEFT" },
        ["<C-j>"] = { "<C-w>j", "Jump To Windows DOWN" },
        ["<C-k>"] = { "<C-w>k", "Jump To Windows UP" },
        ["<C-l>"] = { "<C-w>l", "Jump To Windows RIGHT" },
        ["<TAB>"] = { function() vim.cmd("tabnext") end, "Next Tab" },
        ["<S-TAB>"] = { function() vim.cmd("tabprev") end, "Prev Tab" },

        -- Window manipulations
        ["<C-.>"] = { FontIncrease, "Increase Font Size" },
        ["<C-,>"] = { FontDecrease, "Decrease Font Size" },
        ["<C-Up>"] = { ":resize +2<CR>", "Window Increase Height" },
        ["<C-Down>"] = { ":resize -2<CR>", "Window Decrease Height" },
        ["<C-Left>"] = { ":vertical resize -2<CR>", "Window Decrease Width" },
        ["<C-Right>"] = { ":vertical resize +2<CR>", "Window Increase Width" },

        -- Text manipulations
        ["<A-j>"] = { ":m .+1<CR>==", "Move Line Up" },
        ["<A-k>"] = { ":m .-2<CR>==", "Move Line Down" },
        J = { "mzJ`z", "Fancy Line Pull" },

        -- Harpoon Navigation
        ["<A-a>"] = { harpoon_mark.add_file, "Harpoon Add" },
        ["<A-d>"] = { harpoon_ui.nav_prev, "Harpoon Navigate Prev" },
        ["<A-f>"] = { harpoon_ui.nav_next, "Harpoon Navigate Next" },
        ["<A-s>"] = { harpoon_ui.toggle_quick_menu, "Harpoon Files" },

        -- LSP Shortcuts
        l = {
            name = "[L]sp",
            d = { telescope_builtin.lsp_definitions, '[D]efinition' },
            h = { vim.lsp.buf.hover, '[H]over Documentation' },
            H = { vim.lsp.buf.signature_help, 'Signature [H]elp' },
            i = { telescope_builtin.lsp_implementations, '[I]mplementation' },
            r = { telescope_builtin.lsp_references, '[R]eferences' },
            s = { telescope_builtin.lsp_document_symbols, '[S]ymbols' },
            t = { telescope_builtin.lsp_type_definitions, '[T]ype Definition' },
        },
    },
    { mode = "n" }
)

whichkey.register(
    {
        e = { function() vim.cmd("Neotree source=filesystem toggle=true position=right") end, "File [E]xplorer" },
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
