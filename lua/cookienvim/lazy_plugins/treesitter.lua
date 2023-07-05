-- See languages here: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
-- Installing languages on first install is annoying, but it is a much nicer experience, until a solid centeralized
-- library can achieve similar functionality to VSCode. Some languages are nice to have just incase.
local language_list = {
  'c',
  'cpp',
  'c_sharp',
  'javascript',
  'json',
  'lua',
  'markdown',
  'python',
  'rust',
  'sql',
  'terraform',
  'tsx',
  'typescript',
  'vimdoc',
  'vim',
  'yaml',
}


return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  ensure_installed = language_list,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'gnn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = { ['<leader>a'] = '@parameter.inner', },
      swap_previous = { ['<leader>A'] = '@parameter.inner', },
    },
  },
}
