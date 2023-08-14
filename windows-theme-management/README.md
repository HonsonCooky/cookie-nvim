# Neovim Windows Theme Management

`DEPRECATED`: Cookie-Nvim implementation superseded by
[auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim). Check out their easy to implement solution for
an easier implementation.

The following information is just a record of things to remember for me.

# Using PowerShell In Neovim

```lua
local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = ""
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end
```

# Detecting Current Windows Theme

```lua
local function windows_theme_is_dark()
  local cmdlet = "Get-ItemPropertyValue"
  local path = " -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize"
  local name = " -Name AppsUseLightTheme"
  local cmd = cmdlet .. path .. name
  local reg_value = vim.fn.system(cmd)
  return (string.find(reg_value, "1") == nil)
end
```

# Altering PowerShell Font Colors

- [Table Declaration](https://github.com/HonsonCooky/cookie-nvim/blob/main/lua/cookienvim/thememod.lua#L5)
- [Script Call](https://github.com/HonsonCooky/cookie-nvim/blob/main/lua/cookienvim/thememod.lua#L57)

# Updating Theme On Windows Theme Change

```powershell
Get-ChildItem \\.\pipe\ -Filter '*nvim.*' | ForEach-Object -Parallel {nvim --headless --server $_ --remote-send '<C-\><C-N>:lua require("cookienvim.thememod").align_theme()<CR>'}
```
