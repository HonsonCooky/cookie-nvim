local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup {
    pickers = {
        colorscheme = {
            enable_preview = true,
        },
    },
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
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
    }
}
pcall(require('telescope').load_extension, 'fzf')
