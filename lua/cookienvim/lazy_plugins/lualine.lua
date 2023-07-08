return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      theme = 'catppuccin',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = {
        {
          'filename',
          path = 1,
        },
      },
    },
  },
}
