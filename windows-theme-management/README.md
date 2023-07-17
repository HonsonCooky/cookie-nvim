# Neovim Windows Theme Management

Neovim doesn't come with many caked in features, however, it does an excellent job of creating an interface to extend
the base program. As a developer, I utilize both light and dark themes, to match the environment I'm working in. Windows 
has some applications and features that enable a smoother experience jumping between themes, however, these are not 
automatically implemented in Neovim. 

This subfolder contains resources that aid in creating a smooth theme switching experience on Windows. This document
will outline my approach to:

- Detecting the current Windows theme, and reacting to it.
- Altering the default font colors in PowerShell.
- Updating Neovim on OS theme change.

# Environment Testing

- Windows 10 | 11                       ✅
- PowerShell 5.1.22621.1778 | 7.3.5     ✅
- nvim-qt.exe                           ✅

# Basic Theory

By default, Neovim has an embedded terminal emulator. Thus, we can utilize the power of PowerShell to aid in creating a
theme reactive IDE. Windows stores many of it's runtime configurations in the `registry`. 

## Getting Windows Theme

In the Windows registry, there exists a variable that indicates if Windows is currently using light or dark theme mode.
We can run a PowerShell command to extract this value, and thus, we can access the value in Neovim. Now, we have a
reliable way to determine the OS theme; With a little Lua logic, we can align Neovim to the current Windows OS theme.

See example `./lua/cookienvim/thememod.lua:6`


# Altering PowerShell Font Colors

Using the inbuilt Neovim terminal with PowerShell is easy (once you know where to look). 
`:h powershell` should provide you with all the information you need here, but if you'd like a Lua example, check out 
'./lua/cookienvim/lazy_plugins/toggleterm.lua:9'.

`set-pwsh-font-color.ps1` will update the font colors for the inbuilt Neovim PowerShell terminal (font updates are 
localized to this Neovim instance). PowerShell's default font colors are incredibly difficult to read with a light 
background. So, by running this script on theme change, my inbuilt terminal's highlighting becomes a lot easier to read. 

# update-nvim-themes.ps1

Docs coming in ~24 hours
