local M = {}

BackgroundOptions = { LIGHT = "light", DARK = "dark" }

local powershell_light = "@{" ..
    "Command                  = $PSStyle.Foreground.FromRGB(0x7287fd);" ..
    "Comment                  = $PSStyle.Foreground.FromRGB(0x40a02b);" ..
    "ContinuationPrompt       = $PSStyle.Foreground.FromRGB(0x7287fd);" ..
    "Default                  = $PSStyle.Foreground.FromRGB(0x7287fd);" ..
    "Emphasis                 = $PSStyle.Foreground.FromRGB(0x7287fd);" ..
    "Error                    = $PSStyle.Foreground.FromRGB(0xd20f39);" ..
    "InlinePrediction         = $PSStyle.Foreground.FromRGB(0x4c4f69);" ..
    "Keyword                  = $PSStyle.Foreground.FromRGB(0x40a02b);" ..
    "ListPrediction           = $PSStyle.Foreground.FromRGB(0x40a02b);" ..
    "Member                   = $PSStyle.Foreground.FromRGB(0x8839ef);" ..
    "Number                   = $PSStyle.Foreground.FromRGB(0xfe640b);" ..
    "Operator                 = $PSStyle.Foreground.FromRGB(0x4c4f69);" ..
    "Parameter                = $PSStyle.Foreground.FromRGB(0x4c4f69);" ..
    "String                   = $PSStyle.Foreground.FromRGB(0xfe640b);" ..
    "Type                     = $PSStyle.Foreground.FromRGB(0xfe640b);" ..
    "Variable                 = $PSStyle.Foreground.FromRGB(0x8839ef);" ..
    "ListPredictionSelected   = $PSStyle.Background.FromRGB(0x4c4f69);" ..
    "Selection                = $PSStyle.Background.FromRGB(0x04a5e5);" ..
    "}"

local powershell_dark = "@{" ..
    "Command                  = $PSStyle.Foreground.FromRGB(0x89b4fa);" ..
    "Comment                  = $PSStyle.Foreground.FromRGB(0x40a02b);" ..
    "ContinuationPrompt       = $PSStyle.Foreground.FromRGB(0x89b4fa);" ..
    "Default                  = $PSStyle.Foreground.FromRGB(0x89b4fa);" ..
    "Emphasis                 = $PSStyle.Foreground.FromRGB(0x89b4fa);" ..
    "Error                    = $PSStyle.Foreground.FromRGB(0xeba0ac);" ..
    "InlinePrediction         = $PSStyle.Foreground.FromRGB(0xbac2de);" ..
    "Keyword                  = $PSStyle.Foreground.FromRGB(0xa6e3a1);" ..
    "ListPrediction           = $PSStyle.Foreground.FromRGB(0xa6e3a1);" ..
    "Member                   = $PSStyle.Foreground.FromRGB(0xb4befe);" ..
    "Number                   = $PSStyle.Foreground.FromRGB(0xfab387);" ..
    "Operator                 = $PSStyle.Foreground.FromRGB(0xbac2de);" ..
    "Parameter                = $PSStyle.Foreground.FromRGB(0xbac2de);" ..
    "String                   = $PSStyle.Foreground.FromRGB(0xfab387);" ..
    "Type                     = $PSStyle.Foreground.FromRGB(0xfab387);" ..
    "Variable                 = $PSStyle.Foreground.FromRGB(0xb4befe);" ..
    "ListPredictionSelected   = $PSStyle.Background.FromRGB(0xbac2de);" ..
    "Selection                = $PSStyle.Background.FromRGB(0x89b4fa);" ..
    "}"

local function windows_theme_is_dark()
  local cmdlet = "Get-ItemPropertyValue"
  local path = " -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize"
  local name = " -Name AppsUseLightTheme"
  local cmd = cmdlet .. path .. name
  local reg_value = vim.fn.system(cmd)
  return (string.find(reg_value, "1") == nil) and BackgroundOptions.DARK or BackgroundOptions.LIGHT
end

--~ Switch between light and dark theme. This function does more than switch themes / backgrounds, and should be used
--for all theme changes
--@param force_theme a BackgroundOptions value
function M.theme_handle(force_theme)
  local should_be = force_theme or windows_theme_is_dark()

  -- Only run when changing
  if vim.o.background ~= should_be then
    vim.o.background = should_be
    local powershell_font_theme = (vim.o.background == BackgroundOptions.LIGHT) and powershell_light or powershell_dark
    local powershell_font_cmd = "TermExec cmd=\"Set-PSReadLineOption -Colors " .. powershell_font_theme .. "; cls;\""
    print(powershell_font_cmd)
    pcall(vim.cmd, powershell_font_cmd)
    pcall(vim.cmd, "mode")
  end
end

return M
