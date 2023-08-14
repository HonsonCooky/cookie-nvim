local thememod = require("cookienvim.thememod")
return {
    "f-person/auto-dark-mode.nvim",
    config = {
        update_interval = 1000,
        set_dark_mode = function()
            thememod.align_theme(BackgroundOptions.DARK)
        end,
        set_light_mode = function()
            thememod.align_theme(BackgroundOptions.LIGHT)
        end,
    },
}
