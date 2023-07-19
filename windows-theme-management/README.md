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

# Using PowerShell In Neovim

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

**This is an important step for the rest of this setup**

# Detecting Current Windows Theme

The Windows Registry contains configuration variable states that can be accessed via the shell. By utilizing Neovim's
ability to run shell scripts, we can access the Windows current theme at any time. E.g.:

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

Using the terminal emulator (with ToggleTerm) does not automatically update the font colors of the terminal. This
becomes a problem when keywords highlighted in yellow (e.g. `cd`) are displayed on a white background.

Thankfully, PowerShell font colors can be updated with the cmdlet `Set-PSReadLineOption -Colors @{...}`. The command
uses a hashtable with differnt values for different highlight groups. You can see an example of this in the
`./lua/cookienvim/thememod.lua`:

- [Table Declaration](https://github.com/HonsonCooky/cookie-nvim/blob/main/lua/cookienvim/thememod.lua#L5)
- [Script Call](https://github.com/HonsonCooky/cookie-nvim/blob/main/lua/cookienvim/thememod.lua#L66)

# Updating Theme On Windows Theme Change

One highly under-rated feature from other IDE's and applications, is the ability to update the theme based on the OS.
For those more proactive with their theme switching, global keybindings and applications can be used to quickly switch
between light and dark themes. Unfortunately, Neovim doesn't currently offer this functionality natively (it's
debatable whether it should). Fortunately, Neovim opens up an API via RPC; Running instances can be remotely accessed
and updated.

**_Example:_**
https://github.com/HonsonCooky/cookie-nvim/assets/39540045/7062c852-dc7e-4d5d-800c-53d0bc1559ec

## How It Works

Neovim's API opens a new RPC connection for every new instance. Therefore, the editor running on your local machine has
an endpoint. All we need to do, is somehow find all Neovim RPC endpoints, then send them a command when the OS theme
changes... easy.

## CookieNvim Implementation

On Windows, a popular application for OS theme switching is 'Auto Dark Mode' (ADM). I've used this application for my
implementation, however, the only requirement for viablilty (aside from changing the OS theme), is to be able to run a
custom script.

Now that we can change the OS theme with relative ease, we need to run a script. For ADM, this can be accessed by:

- **_In App:_** Go to the bottom of the `settings` panel, and click the link `Open config folder`.
- **_Path:_** `$Env:APPDATA\AutoDarkMode`

Inside the ADM folder, there is a `scripts.yaml` file. You can find further instructions on how to set this up
[here](https://github.com/AutoDarkMode/Windows-Auto-Night-Mode/wiki/How-to-add-custom-scripts). I've stored a copy of my
implementation in the `./windows-theme-management/scripts.yaml` file.

The yaml script runs every time ADM changes the theme. CookieNvim's implementation triggers a PowerShell script
(`nvim-rmt-theme.ps1`), which in turn, sends the nvim API command to all found RPC pipelines. You may notice that
`nvim-rmt-theme.ps1` is a one liner. This was an attempt to minize the setup, by running the command directly from the
ADM yaml script. Unfortunately, for one reason or another, I have not successfully found a way to achieve this. It's not
all bad new though, any updates to the theme changing vim command, can be achieved without needing to restart ADM.

### Potential Alternative

I haven't explored this idea fully yet, as it seems resource wasteful. However, Neovim has the ability to run background
tasks. One could setup a forever loop, that checks the Windows Registry and reacts to changes. This code could exist as
part of your Neovim configuration, and therefore, have no external dependancies.

I was able to successfully mock a lua function implements this (but I haven't gone as far as to make it a running
background process). The benefit of this design (beyond removing external dependancies) could be fast reactivity. The
ADM approach changes the OS theme, THEN runs the script (adding a slight delay to the change). This implementation would
remove a lot of steps in the process.

CookieNvim uses the ADM reactive approach, as theme switching does not occur often throughout the day; Neovim may be
open for hours, and never change theme. Having an automated theme switcher however, is a nice add on that removes some
friction from being a Neovim developer.

If you have some idea on how to achieve this alternative efficiently, I'd be very keen to hear about it.
