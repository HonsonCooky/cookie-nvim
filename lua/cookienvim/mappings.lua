-- Where possible, keybindings are placed in the `after/plugin/whichkey.lua`.
-- Furthermore, these shortcuts provide small creature comforts, but aim to avoid re-writing defaults

local keymap = vim.keymap.set
local function opts(msg)
  return {
    desc = msg,
    noremap = true,
    silent = true,
  }
end

-- Enable ; to act as :
keymap("n", ";", ":", opts("Open commandline"))

-- :noh on escape
keymap("n", "<esc>", "<esc>:noh<cr>", opts("Save and Remove highlighted text"))

-- Visual movements
keymap("v", "J", ":m '>+1<CR>gv=gv", opts("Move selected line down"))
keymap("v", "K", ":m '<-2<CR>gv=gv", opts("Move selected line up"))

-- Window movements
keymap("n", "<C-h>", "<C-w>h", opts("Move window left"))
keymap("n", "<C-j>", "<C-w>j", opts("Move window down"))
keymap("n", "<C-k>", "<C-w>k", opts("Move window up"))
keymap("n", "<C-l>", "<C-w>l", opts("Move window right"))

-- Keep Center
keymap("n", "J", "mzJ`z", opts("Pull line up"))
keymap("n", "<C-d>", "<C-d>zz", opts("Center half page down"))
keymap("n", "<C-u>", "<C-u>zz", opts("Center half page up"))
keymap("n", "n", "nzzzv", opts("Next search"))
keymap("n", "N", "Nzzzv", opts("Prev search"))

-- Other
keymap("n", "<C-a>", "ggVG", opts("Highlight All"))
keymap("n", "<TAB>", function() vim.cmd("tabnext") end, opts("Next Tab"))
keymap("n", "<S-TAB>", function() vim.cmd("tabprev") end, opts("Prev Tab"))
