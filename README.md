# CookieNvim

Welcome to CookieNvim, an opinionate Neovim configuration for Windows 10/11. As a Neovim configuration, my focus is on
the following (ordered by importance):

- **_Usablilty:_** Runs with personal && work computers (no admin privileges).
- **_Replicability:_** Environment requirements are setup programmatically.
- **_Ease-Of-Use:_** Intelli-sense | Debugging | Automatic Themes | Keybindings for RSI sake.
- **_Minimalist:_** As little 'CookieNvim specific' components, as possible.

CookieNvim is a personal configuration. As such, post configuration of themes, keybindings, etc are not foudn here (see
LunarVim, NvChad, AstroNvim, or LazyVim for such environments). However, being an open-source Neovim configuration, you
can always fork/copy this configuration and make it your own 🙂.

## Default Development Environments

By default, CookieNvim is setup for the following:

- `.Net | C#`,
- `NodeJS | TypeScript | Vue.js | Next.js | Tailwindcss`,
- `Rust`,
- `GitHub | Workflows | CodeSpaces`,
- `Azure Cloud Services`

## CookieNvim Specific Features

- Integration with 'Auto Dark Mode'.
- Dynamic PowerShell font colors.
- Automatic NerdFont setup.
- Programmatic Installation.

# Installation

## Windows:

- Backup || Remove: `nvim` and `nvim-data` from `$Env:LOCALAPPDATA`,
- Create a `source` directory inside of `$HOME`,
- Install PowerShell 7 _(optional)_,
- Install Git,
- Inside PowerShell run the following:

```
git clone https://github.com/HonsonCooky/cookie-nvim $env:LOCALAPPDATA\nvim;
.\$env:LOCALAPPDATA\nvim\install.ps1;
```

- Run `Neovim` executable (Windows Search: `nvim-qt`)

## Other

Currently, CookieNvim is setup for Windows-Only use. Future updates to my development envrionment may change this.

# Packages

**_PackageManager:_** [lazy.nvim](https://github.com/folke/lazy.nvim)

All packages (and configurations) can be found in the `./lua/cookienvim/lazy_plugins` directory.

| Package Name                        | Description                                       |
| ----------------------------------- | ------------------------------------------------- |
| [comment.nvim][comment]             | Comment out highlighted lines                     |
| [gitsigns.nvim][gitsigns]           | Git sidebar decorators                            |
| [harpoon][harpoon]                  | Jump between marked buffers                       |
| [lazygit.nvim][lazygit]             | Git UI                                            |
| [lualine.nvim][lualine]             | Prettier status line                              |
| [indent-blankline.nvim][indent]     | VSCode-Style indentation highlighting             |
| [neo-tree.nvim][neotree]            | File Explorer                                     |
| [null-ls.nvim][nullls]              | Code Formatting                                   |
| [nvim-autopairs][autopairs]         | Insert closing characters (), {}, etc             |
| [nvim-cmp][autocomplete]            | Completion engine, intellisense                   |
| [nvim-highlight-colors][highlights] | #ffffff inline color highlighting                 |
| [nvim-lspconfig][lspconfig]         | Language Server Protocol for syntactic assistance |
| [nvim-treesitter][treesitter]       | Syntax highlighting                               |
| [telescope.nvim][telescope]         | Fuzzy Finding UI                                  |
| [toggleterm.nvim][toggleterm]       | Integrated terminal manager                       |
| [vim-fugitive][fugitive]            | Git CLI from vim commandline                      |
| [vim-rhubarb][rhubarb]              | Fugitive extension for URLS                       |
| [which-key.nvim][whichkey]          | UI Keybinding assistance                          |

[autopairs]: https://github.com/windwp/nvim-autopairs
[autocomplete]: https://github.com/hrsh7th/nvim-cmp
[comment]: https://github.com/numToStr/Comment.nvim
[fugitive]: https://github.com/tpope/vim-fugitive
[gitsigns]: https://github.com/lewis6991/gitsigns.nvim
[harpoon]: https://github.com/ThePrimeagen/harpoon
[highlights]: https://github.com/brenoprata10/nvim-highlight-colors
[indent]: https://github.com/lukas-reineke/indent-blankline.nvim
[lazygit]: https://github.com/kdheepak/lazygit.nvim
[lspconfig]: https://github.com/neovim/nvim-lspconfig
[lualine]: https://github.com/nvim-lualine/lualine.nvim
[neotree]: https://github.com/nvim-neo-tree/neo-tree.nvim
[nullls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[rhubarb]: https://github.com/tpope/vim-rhubarb
[telescope]: https://github.com/nvim-telescope/telescope.nvim
[toggleterm]: https://github.com/akinsho/toggleterm.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[whichkey]: https://github.com/folke/which-key.nvim
