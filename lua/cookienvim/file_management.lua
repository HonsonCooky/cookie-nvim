local ts = require("telescope")
local wk = require("which-key")

--[[SETUP: Implement all settings, even though most are their defaults]]
ts.setup({
    defaults = {
        initial_mode = 'normal',
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
        project = {
            base_dirs = { '~/source' },
            search_by = { "title", "path" }
        }
    }
})
pcall(ts.load_extension, "file_browser")
pcall(ts.load_extension, 'fzf')
pcall(ts.load_extension, 'project')
pcall(ts.load_extension, 'ui-select')

--[[Builtin Keybindings]]
local tb = require("telescope.builtin")
local tf = ts.extensions.file_browser.file_browser
local tp = ts.extensions.project.project
wk.register(
    {
        f = {
            name = "[F]ile",
            f = { tf, "[F]ile Browser" },
            p = { tp, "[P]rojects" },
            s = { tb.find_files, "[S]earch Files" },
            j = {
                name = "Action",
                b = { tb.buffers, "[B]uffers" },
                g = { tb.git_files, "[G]it" },
                h = { tb.oldfiles, "[H]istory" },
                t = { tb.live_grep, "[T]ext" },
                w = { tb.grep_string, "[W]ord" },
            },
            k = {
                name = "Help",
                d = { tb.diagnostics, "[D]iagnostics" },
                D = { tb.lsp_definitions, '[D]efinition' },
                h = { tb.help_tags, "[H]elp" },
                i = { tb.lsp_implementations, '[I]mplementation' },
                r = { tb.lsp_references, '[R]eferences' },
                s = { tb.lsp_document_symbols, '[S]ymbols' },
                t = { tb.lsp_type_definitions, '[T]ype Definition' },
            },
        },
    },
    { mode = 'n', prefix = '<leader>', noremap = true }
)
