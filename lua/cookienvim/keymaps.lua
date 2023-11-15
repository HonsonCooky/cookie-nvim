local gitsigns = require('gitsigns')

local telescope_builtin = require("telescope.builtin")
local whichkey = require("which-key")

local configuration = {}

whichkey.setup(configuration)

--[[
    NORMAL MODE
]]
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
        ["<C-.>"] = { Font_Increase, "Increase Font Size" },
        ["<C-,>"] = { Font_Decrease, "Decrease Font Size" },
        ["<C-Up>"] = { ":resize +2<CR>", "Window Increase Height" },
        ["<C-Down>"] = { ":resize -2<CR>", "Window Decrease Height" },
        ["<C-Left>"] = { ":vertical resize -2<CR>", "Window Decrease Width" },
        ["<C-Right>"] = { ":vertical resize +2<CR>", "Window Increase Width" },

        -- Text manipulations
        ["<A-j>"] = { ":m .+1<CR>==", "Move Line Up" },
        ["<A-k>"] = { ":m .-2<CR>==", "Move Line Down" },
        J = { "mzJ`z", "Fancy Line Pull" },

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

        -- UI Manipulations
        u = {
            name = "[U]ser Interface",
            s = { Toggle_Spell_Check, "Toggle [S]pell Check" },
            w = { Toggle_Wrap, "Toggle Text [W]rap" },
        }
    },
    { mode = "n" }
)

whichkey.register(
    {
        e = { function() vim.cmd("Neotree source=filesystem toggle=true position=right") end, "File [E]xplorer" },
    },
    { mode = "n", prefix = "<leader>" }
)

--[[
    VISUAL MODE
]]
whichkey.register({
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move Line Down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move Line Up" },
        ["<"] = { "<gv", "Indent Decrease" },
        [">"] = { ">gv", "Indent Increase" }
    },
    { mode = "v" }
)

--[[
    TERMINAL MODE
]]
whichkey.register({
        ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Jump To Windows LEFT" },
        ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Jump To Windows DOWN" },
        ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Jump To Windows UP" },
        ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Jump To Windows RIGHT" },
    },
    { mode = "t" }
)
