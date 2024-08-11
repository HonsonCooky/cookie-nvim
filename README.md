# CookieNvim - Deprecated

## Neovim Journey

After hearing about the amazing Neovim, I decided to get myself a License-To-Motion and register to be Blazingly-Fast.
As I was warned, learning this new tool was incredibly difficult! I wasn't aware of just how difficult, so let me spell
it out for everyone. You need to learn:

- Vim Motions
- Lua
- Vim Defaults
- Neovim API
- Plugin APIs

This list consists of three different documentation styles (Neovim, Lua, GitHub), and several different philosophies for
achieving a cohesive development environment. So, to those who intend on switching to Neovim, be ware the deep end
you're about to dive into.

Though learning Neovim was tough, there is a plentiful eco-system that abstracts away the requirement to DIY an IDE. My
configuration went through several different phases (which are maintained by branches in this repo):

- `v1.0.0` First implementation after playing around with community configurations like AstroNvim, NVChad, LunarVim, etc.
- `v2.0.0` To enable easier configuration management, reordered and reduced the number of `.lua` files in the config.
- `v3.0.0` Reduced file configuration to one `init.lua` file, with the removal of unused plugins.
- `v4.0.0` Removed and added more plugins that v3.0.0 was missing, and LSP Update! (Removed WHICH-KEY)

During my time using Neovim (only about two years) I was able to build personal and professional projects. The reduced
IDE setup meant that I was introduced to a wealth of CLI commands that I otherwise wouldn't have used. `dotnet`, `grep`,
and mastering PowerShell all came as a consequence of my decision to use Neovim.

## Back to VSCode

The nail in the coffin for me was my attempted commitment to the `.NET` ecosystem. The job market where I live is pretty
reliant on Microsoft technologies. It wasn't particularly easy to get C# (with CSharpier) and TypeScript (with prettier)
up and running. However, after learning more about how the LSP ecosystem works in Neovim, I did manage to get there in
the end.

Unfortunately, Blazor development is not yet supported by any of the major Neovim LSP providers - and after attempting
to get it running with other third party plugins, I felt tired. In truth, I've spent more time attempting to learn
Neovim over the past two years, than actually engineering software solutions. I'm tired of having to reinvent myself and
my config to get that frictionless setup - allowing me to focus on the programming ecosystem that I'm attempting to work
in.

So why did I leave VSCode in the first place? Workspace Clutter and Keyboard Centric Navigation. For me, having an
overly crowded computer screen and moving my hand from the home row to the mouse, generates a LOT of extra friction. So
the idea of using an IDE with a simplistic UI designed for keyboard only interactions seemed like a dream. Whilst this
dream was almost perfect, it's one short-coming was the lack of better language support.
