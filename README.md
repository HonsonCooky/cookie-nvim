# CookieNvim

- **_v2.0.0_**

Welcome to CookieNvim, an opinionated Neovim configuration. As a personal development environment, this configuration is
heavily influenced by the personal preferences of HonsonCooky.

# Design

This Neovim configuration is designed to provide the bones of an IDE. Like VSCode, it's setup to handle LSP's and
formatters, but by default, only Lua languages are installed. With the assistance of "Mason", LSP languages can be
installed on the fly, and because Lua is preinstalled, any oddballs can be manually added when necessary.

# Windows First

My primary development OS is Windows 11. This configuration is designed on, and for this operating system, however,
there is very little Windows specific configuration. The lack of pre-installed language servers is specifically to
ensure that this configuration can be used for Codespaces. Once in a codespace, the necessary languages will need to be
set up.
