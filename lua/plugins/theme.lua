return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    dependencies = {
        "f-person/auto-dark-mode.nvim",
    },
    config = function()
        require("catppuccin").setup({ no_italic = true })
        vim.cmd.colorscheme("catppuccin")
        require("auto-dark-mode").setup({
            update_interval = 1000,
            set_dark_mode = function()
                vim.o.background = "dark"
            end,
            set_light_mode = function()
                vim.o.background = "light"
            end,
        })
    end,
}
