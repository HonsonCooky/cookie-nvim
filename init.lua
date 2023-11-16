--[[
    NOTE: I'm aware that usually people usually defer there entire build into a custom
    submodule, and then only have one require call in this file. This is my personal
    setup, so I'm not really keen to have the extra abstractions that are not necessary.

    Lua files are split based on included functionality (not package names).
]]

-- Download external plugins (lazy.nvim installs ONLY)
require("cookienvim.extern_packages")

-- Initialize Vim defaults (Must go before setup)
require("cookienvim.builtin_setup")

-- Setup Whichkey for keymapping during setup
require("which-key").setup({})

-- Configure Neovim Setup
require("cookienvim.builtin_keymaps")
require("cookienvim.user_interface")
require("cookienvim.file_management")
require("cookienvim.language_setup")


-- Jump into the "source" repo
local source_repo_loc = os.getenv("UserProfile") .. "/source"
vim.cmd("cd " .. source_repo_loc)
