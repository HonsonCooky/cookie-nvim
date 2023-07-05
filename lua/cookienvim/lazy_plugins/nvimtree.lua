-- In this setup, we only change the icons to remove the necessity for nerdfonts (which are a pain to manage)
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  config = function()
    require("nvim-tree").setup {}
  end
}
