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

local function update_terminals(force_theme)
  local terminals = toggleTerm.get_all(true)
  for _, v in pairs(terminals) do
    local term = toggleTerm.get(v.id, true)
    if (term == nil) then goto continue end
    local forced_theme = force_theme or ""
    print(forced_theme)
    term:send(". $PROFILE " .. forced_theme .. "; cls;", true)
    ::continue::
  end
end

function M.align_theme(force_theme)
  local should_be = force_theme or windows_theme_is_dark()

  -- Only run when changing
  if vim.o.background ~= should_be then
    vim.o.background = should_be
    update_terminals(force_theme)
    vim.cmd("mode")
  end
end

return M
