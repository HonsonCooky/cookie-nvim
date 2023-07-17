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

| Package Name                | Description                           |
| --------------------------- | ------------------------------------- |
| [nvim-autopairs][autopairs] | Insert closing characters (), {}, etc |

|

[autopairs]: https://github.com/windwp/nvim-autopairs
