--[[
    Setup and initialize colors, fonts and other visual components
]]

-- ColorScheme
vim.cmd.colorscheme("catppuccin")

-- AutoDarkMode
require('auto-dark-mode').setup({
    update_interval = 1000,
    set_dark_mode = function()
        vim.o.background = 'dark'
        vim.cmd("mode")
    end,
    set_light_mode = function()
        vim.o.background = 'light'
        vim.cmd("mode")
    end,
})

-- Fonts
local font_family = "JetBrainsMono NFM"
local font_size = 14
local step_size = 1
local max_size = 20
local min_size = 4

local function font_setup()
    vim.o.guifont = font_family .. ":h" .. font_size
end

function FontIncrease()
    local prefix_count = math.max(vim.v.count, 1)
    local increment = step_size * prefix_count
    font_size = math.min(font_size + increment, max_size)
    font_setup()
end

function FontDecrease()
    local prefix_count = math.max(vim.v.count, 1)
    local decrement = step_size * prefix_count
    font_size = math.max(font_size - decrement, min_size)
    font_setup()
end

font_setup()

-- Visual Aid
function ToggleWrap()
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

function ToggleSpell()
    vim.opt_local.spell = not vim.opt_local.spell:get()
    vim.cmd("mode")
    print("Spell check is " .. (vim.opt_local.spell:get() and "on" or "off"))
end
