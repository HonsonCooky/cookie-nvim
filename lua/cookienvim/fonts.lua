local M = {}
local font_family = "JetBrainsMono\\ NFM"
local font_size = 12
local step_size = 1
local max_size = 20
local min_size = 10

function M.setup()
    pcall(
        function()
            vim.cmd("silent! set guifont=" .. font_family .. ":h" .. font_size)
        end,
        'cnext'
    )
end

function M.font_increase()
    local prefix_count = math.max(vim.v.count, 1)
    local increment = step_size * prefix_count
    font_size = math.min(font_size + increment, max_size)
    M.setup()
end

function M.font_decrease()
    local prefix_count = math.max(vim.v.count, 1)
    local decrement = step_size * prefix_count
    font_size = math.max(font_size - decrement, min_size)
    M.setup()
end

return M
