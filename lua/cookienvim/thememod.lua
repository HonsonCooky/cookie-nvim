local utilmods = require "cookienvim.utilmods"
local toggleTerm = require "toggleterm.terminal"
local M = {}

BackgroundOptions = { LIGHT = "light", DARK = "dark" }

local function windows_theme_is_dark()
  local cmdlet = "Get-ItemPropertyValue"
  local path = " -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize"
  local name = " -Name AppsUseLightTheme"
  local cmd = cmdlet .. path .. name
  local reg_value = vim.fn.system(cmd)
  return (string.find(reg_value, "1") == nil) and BackgroundOptions.DARK or BackgroundOptions.LIGHT
end

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

function M.align_theme(force_theme, init)
  local should_be = force_theme or windows_theme_is_dark()

  -- Only run when changing
  if init or vim.o.background ~= should_be then
    vim.o.background = should_be
    update_terminals(should_be)
    update_lazygit(should_be)
    vim.cmd("mode")
  end
end

return M
