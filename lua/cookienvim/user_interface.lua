--[[
Setup the user interface that will make the IDE look the way it does. This is every from colorscheme, to inline
terminals, to file explorers. Also, provided are functions to aid in interacting with these systems.
]]

--[[ColorScheme]]
vim.cmd.colorscheme("rose-pine")

--[[AutoDarkMode]]
require("auto-dark-mode").setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.o.background = "dark"
		vim.cmd("mode")
	end,
	set_light_mode = function()
		vim.o.background = "light"
		vim.cmd("mode")
	end,
})

--[[Fonts]]
local font_family = "JetBrainsMono NFM"
local font_size = 14
local max_size = 20
local min_size = 4

local function font_setup()
	vim.opt.guifont = font_family .. ":h" .. font_size
end

function Font_Increase()
	local prefix_count = math.max(vim.v.count, 1)
	font_size = math.min(font_size + prefix_count, max_size)
	font_setup()
end

function Font_Decrease()
	local prefix_count = math.max(vim.v.count, 1)
	font_size = math.max(font_size - prefix_count, min_size)
	font_setup()
end

font_setup()

--[[LuaLine]]
require("lualine").setup()

--[[TeleScope]]
local ts = require("telescope")
ts.setup({
	defaults = {
		initial_mode = "normal",
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
	},
})
ts.load_extension("fzf")
ts.load_extension("file_browser", { previewer = false })
ts.load_extension("ui-select")

--[[Visual Aid]]
function Toggle_Wrap()
	if vim.o.wrap then
		vim.o.textwidth = 0
		vim.o.wrap = false
		vim.o.colorcolumn = ""
	else
		vim.o.textwidth = 120
		vim.o.wrap = true
		vim.o.colorcolumn = "121"
	end
end

function Toggle_Spell_Check()
	local buf = vim.api.nvim_get_current_buf()
	local new_val = not vim.api.nvim_get_option_value("spell", { buf = buf })
	vim.api.nvim_set_option_value("spell", new_val, { buf = buf })
end
