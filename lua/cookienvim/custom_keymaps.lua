local whichkey = require("which-key")
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
    ["<leader>n"] = {
      name = "[N]eo Tree",
      b = { ":Neotree source=buffers toggle=true position=right reveal=true<CR>", "[B]uffer Explorer" },
      g = { ":Neotree source=git_status toggle=true position=right reveal=true<CR>", "[G]it Status" },
      l = { ":Neotree source=last toggle=true position=right reveal=true<CR>", "[L]ast Source" },
    },

    -- Language Assistance
    ["<leader>l"] = {}
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
