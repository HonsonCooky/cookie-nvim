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
        g = {
            name = "[G]oTo",
            d = { telescope_builtin.lsp_definitions, '[D]efinition' },
            i = { telescope_builtin.lsp_implementations, '[I]mplementation' },
            r = { telescope_builtin.lsp_references, '[R]eferences' },
            s = { telescope_builtin.lsp_document_symbols, '[S]ymbols' },
            t = { telescope_builtin.lsp_type_definitions, '[T]ype Definition' },
        },
        H = { vim.lsp.buf.signature_help, 'Signature [H]elp' },
        K = { vim.lsp.buf.hover, 'Hover Documentation' },
    },
    { mode = "n" }
)

whichkey.register(
    {
        d = {
            name = "[D]iagnostics",
            f = { vim.diagnostic.open_float, "[F]loat" },
            n = { vim.diagnostic.goto_next, "[N]ext" },
            p = { vim.diagnostic.goto_prev, "[P]revious" },
            s = { ToggleSpell, "[S]pell Check Toggle" },
        },
        e = { function() vim.cmd("Neotree source=filesystem toggle=true position=right") end, "File [E]xplorer" },
        f = {
            name = "[F]ind",
            ["/"] = { telescope_builtin.oldfiles, "History" },
            b = { telescope_builtin.buffers, "[B]uffers" },
            d = { telescope_builtin.diagnostics, "[D]iagnostics" },
            f = { telescope_builtin.find_files, "[F]iles" },
            g = { telescope_builtin.git_files, "[G]it" },
            h = { telescope_builtin.help_tags, "[H]elp" },
            t = { telescope_builtin.live_grep, "[T]ext" },
            w = { telescope_builtin.grep_string, "[W]ord" },
        },
        g = {
            name = "[G]it",
            g = { function() vim.cmd("LazyGit") end, "Lazy[G]it" },
            p = { gitsigns.prev_hunk, "[P]revious Hunk" },
            n = { gitsigns.next_hunk, "[N]ext Hunk" },
            h = { gitsigns.preview_hunk, "Preview [H]unk" },
        },
        l = {
            name = "[L]SP",
            a = { vim.lsp.buf.code_action, 'Code [A]ction' },
            f = { vim.lsp.buf.format, '[F]ormat' },
            r = { vim.lsp.buf.rename, '[R]ename' },
            w = { ToggleWrap, '[W]rap' },
        },
        r = { function() vim.cmd("e!") end, '[R]eload Buffer' },
        t = { function() vim.cmd("Telescope colorscheme") end, "[T]heme [T]elescope" },
    },
    { mode = "n", prefix = "<leader>" }
)

whichkey.register({
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move Line Down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move Line Up" },
        ["<"] = { "<gv", "Indent Decrease" },
        [">"] = { ">gv", "Indent Increase" }
    },
    { mode = "v" }
)


whichkey.register({
        ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Jump To Windows LEFT" },
        ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Jump To Windows DOWN" },
        ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Jump To Windows UP" },
        ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Jump To Windows RIGHT" },
    },
    { mode = "t" }
)
