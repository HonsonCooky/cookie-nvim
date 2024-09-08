return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        renderer = {
            full_name = true,
        },
        view = {
            side = 'right'
        }
    }
}
