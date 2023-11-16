local whichkey = require("which-key")

--[[NORMAL MODE]]
whichkey.register({
        -- Terminal
        ["<C-`>"] = { function() vim.cmd("") end, "Open Terminal" },

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
        ["<C-.>"] = { Font_Increase, "Increase Font Size" },
        ["<C-,>"] = { Font_Decrease, "Decrease Font Size" },
        ["<A-j>"] = { ":m .+1<CR>==", "Move Line Up" },
        ["<A-k>"] = { ":m .-2<CR>==", "Move Line Down" },
        J = { "mzJ`z", "Fancy Line Pull" },

        -- UI Manipulations
        ["<leader>u"] = {
            name = "[U]ser Interface",
            s = { Toggle_Spell_Check, "Toggle [S]pell Check" },
            w = { Toggle_Wrap, "Toggle Text [W]rap" },
        },

        ["<leader>w"] = { function () vim.cmd("wa") end, "[W]rite All"},
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
        ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Jump To Windows LEFT" },
        ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Jump To Windows DOWN" },
        ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Jump To Windows UP" },
        ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Jump To Windows RIGHT" },
    },
    { mode = "t", noremap = true }
)
