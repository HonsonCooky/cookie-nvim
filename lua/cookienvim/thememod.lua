local M = {}

local is_windows_os = string.find(string.lower(vim.loop.os_uname().sysname), "windows") ~= nil

-- Align theme with Windows 10/11 system theme
local function windows_theme_is_dark()
  -- Get Windows theme register for using light theme. 0 == dark, 1 == light
  local path = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize"
  local key = "SystemUsesLightTheme"
  local sys_comm = "reg query " .. path .. ' /v "' .. key .. '"'
  local light_theme_sys_reg = vim.fn.system(sys_comm) -- returns hex value for register
  local light_theme_sys_str = string.gsub(light_theme_sys_reg, "%s+", "") -- remove whitespace
  local register_value = string.sub(light_theme_sys_str, -1) -- extract last value
  return register_value == "0"
end

-- An approximation of what a ubuntu-based switch may look like (haven't used outside codespaces)
local function linux_theme_is_dark()
  local light_theme_sys_reg = vim.fn.system("gsettings get org.gnome.desktop.interface gtk-theme")
  local light_theme_sys_str = string.gsub(light_theme_sys_reg, "%s+", "") -- remove whitespace
  local sys_is_light = string.find(light_theme_sys_str, "dark") == nil
  return not sys_is_light
end

-- Align Nvim theme
local function theme_alignment(is_os_dark)
  if (is_os_dark) then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end

-- Run at start
function M.theme_handle()
  if (is_windows_os) then
    theme_alignment(windows_theme_is_dark())
  else
    theme_alignment(linux_theme_is_dark())
  end
end

return M
