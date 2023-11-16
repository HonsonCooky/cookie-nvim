local telescope = require("telescope")

--[[SETUP: Implement all settings, even though most are their defaults]]
telescope.setup({})
pcall(telescope.load_extension, "file_browser")
pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'project')
pcall(telescope.load_extension, 'ui-select')
