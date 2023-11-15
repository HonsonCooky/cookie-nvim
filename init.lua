--[[
    NOTE: I'm aware that usually people usually defer there entire build into a custom
    submodule, and then only have one require call in this file. This is my personal
    setup, so I'm not really keen to have the extra abstractions that are not necessary.

    Lua files are split based on included functionality (not package names).
]]

-- Initialize Vim defaults (vim.g.mapleader, etc)
require("cookienvim.builtin_setup")

-- Download external plugins (lazy.nvim installs ONLY)
require("cookienvim.extern_packages")

-- Configure the packages to
require("cookienvim.language_setup")
require("cookienvim.fuzzy_finder")
require("cookienvim.user_interface")

-- Setup custom keymaps
require("cookienvim.keymaps")

-- Jump into the "source" repo
local source_repo_loc = os.getenv("UserProfile") .. "/source"
vim.cmd("cd " .. source_repo_loc)
