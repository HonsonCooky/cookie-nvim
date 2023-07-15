# Cookie Nvim

Welcome to Cookie Nvim. A customized, opinionate Neovim configuration. This particular configuration is specifically
designed for Windows (10/11), but has pathways for Linux extensions in the future.

Cookie Nvim's implementation is primarily setup for development in:

- `.Net | C#`,
- `NodeJS | TypeScript | Vue.js | Next.js | Tailwindcss`,
- `Rust`,
- `GitHub | Workflows | CodeSpaces`,
- `Azure Cloud Services`

# Installation

### Windows:

- Backup || Remove: `nvim` and `nvim-data` from `$env:LOCALAPPDATA`,
- Create a `source` directory inside of `$HOME`,
- Install latest PowerShell,
- Inside PowerShell run the following:

```
git clone https://github.com/HonsonCooky/cookie-nvim $env:LOCALAPPDATA\nvim;
.\$env:LOCALAPPDATA\nvim\install.ps1;
```

- Run `Neovim` executable (Windows Search: `nvim-qt`)
