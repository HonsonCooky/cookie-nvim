-- For the purposes of this configuration, NeoTree is not used as the primary navigation
-- tool. Keybindings, Telescope and Harpoon are designed to be used before falling back
-- to NeoTree. For this configuration, NeoTree offers an abstract oversight, and a means
-- to change directory visually.
return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "ThePrimeagen/harpoon",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({})
    end
}
