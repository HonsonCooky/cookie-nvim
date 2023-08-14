local toggleTerm = require "toggleterm.terminal"
local M = {}

BackgroundOptions = { LIGHT = "light", DARK = "dark" }

local function update_lazygit(theme)
  local config_loc = os.getenv("UserProfile") ..
      "\\AppData\\Local\\nvim\\windows-theme-management\\lazygit-config-" .. theme .. ".yaml"
  vim.g.lazygit_use_custom_config_file_path = 1
  vim.g.lazygit_config_file_path = config_loc
end

local function update_terminals(theme)
  local terminals = toggleTerm.get_all(true)
  for _, v in pairs(terminals) do
    local term = toggleTerm.get(v.id, true)
    if (term == nil) then goto continue end
    term:send(". $PROFILE " .. theme .. "; cls;", true)
    ::continue::
  end
end

function M.align_theme(theme)
  if vim.o.background ~= theme then
    vim.o.background = theme
    update_terminals(theme)
    update_lazygit(theme)
    vim.cmd("mode")
  end
end

return M
