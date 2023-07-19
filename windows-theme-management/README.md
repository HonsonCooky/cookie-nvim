# Neovim Windows Theme Management

This subfolder contains resouces to aid with theme management in Neovim. CookieNvim uses these resources to aid in
delivering the following feature set:

- Detecting the current Windows theme, and reacting to it.
- Altering the inbuilt PowerShell terminal's font colors.
- Updating the Neovim theme on update.

# Environment Testing

- Windows 10 | 11 ✅
- PowerShell 5.1.22621.1778 | 7.3.5 ✅
- nvim-qt.exe ✅

# Detecting Current Windows Theme

By default, Neovim has an embedded terminal emulator, and can run shell scripts. Windows Registry contains configuration
variable states, that can be accessed via the shell. Combining these two concepts, we get the following:

```lua
local function windows_theme_is_dark()
    -- Build the shell command
    local path = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize"
    local key = "SystemUsesLightTheme"
    local sys_comm = "reg query " .. path .. ' /v "' .. key .. '"'

    -- Execute shell command; Getting back register value (hex number).
    local light_theme_sys_reg = vim.fn.system(sys_comm)

    -- String manipulation: Convert output (0x00000000 | 0x00000001) to simple value.
    -- This part is optional, and I do it for future potential. You can just "== "0x00000000""
    local light_theme_sys_str = string.gsub(light_theme_sys_reg, "%s+", "")
    local register_value = string.sub(light_theme_sys_str, -1)

    -- 0x00000000 = dark, 0x00000001 = light
    return register_value == "0"
end
```

# Altering PowerShell Font Colors

Using the inbuilt Neovim terminal on Windows will default to Command Prompt. However, updating to use with PowerShell
is easy (once you know where to look). `:h powershell`. The following is an example of how to setup PowerShell in `Lua`.

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

Using the terminal emulator (with ToggleTerm) does not automatically update the font colors of the terminal. This
becomes a problem when keywords highlighted in yellow (e.g. `cd`) are displayed on a white background.

The powershell script `set-pwsh-font-color.ps1` updates the font color of the terminal it is run inside of. These font
colors only effect the current terminal and it's session, so we can run this script without fear of disturbing the rest
of our Windows PowerShell instances. This is a nice little add on, to improve the usability of the inbuilt terminal.

# Updating Theme On Windows Theme Change

On of the more underrated features of VSCode, is it's ability to react to the OS theme. Thus, programs that enable you
to switch OS theme with a keybinding, double as IDE theme changers. This removes a lot of friction with theme
management, enabling developers to quickly change theme depending on brightness levels in the room.

On Windows, a common application for theme switching is
[Auto Dark Mode](https://apps.microsoft.com/store/detail/auto-dark-mode/XP8JK4HZBVF435). This application only switches
the OS theme, however, programs like VSCode, Edge and Chrome will respond to this theme change. Unfortunately, Neovim
doesn't have this same feature, which makes



https://github.com/HonsonCooky/cookie-nvim/assets/39540045/7062c852-dc7e-4d5d-800c-53d0bc1559ec


