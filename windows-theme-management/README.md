# Neovim Windows Theme Management

This folder contains necessary components to ensure the theme of my Neovim window is optimized. The functionality in these scripts are:

- Updating PowerShell font colors on theme update (readability).
- Updating Neovim theme on Windows theme change (ease of use).

# set-pwsh-font-color

Using the inbuilt Neovim terminal with PowerShell is easy (once you know where to look). 
`:h powershell` should provide you with all the information you need here, but if you'd like a Lua example, check out './lua/cookienvim/lazy_plugins/toggleterm.lua:9'.

`set-pwsh-font-color.ps1` will update the font colors for the inbuilt Neovim PowerShell terminal (font updates are localized to this Neovim instance).
PowerShell's default font colors are incredibly difficult to read with a light background. So, by running this script on theme change, my inbuilt terminal's highlighting becomes a lot easier to read. 


# update-nvim-themes.ps1

Docs coming in ~24 hours
