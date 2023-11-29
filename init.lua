--[[
    Note: This is a personal setup. Whilst standard practice is to embed the initialization file inside the lua
    package for modularity, this is not a module. The extra layer of abstraction provides more clutter in the repo.
    As such, this file is used to orchestrate the initialization of cookie-nvim.
]]


require("cookienvim.plugin_manager") -- Download necessary external packages first
require("cookienvim.vim_setup")      -- Setup vim builtin settings
require("cookienvim.user_interface") -- Setup the UI
