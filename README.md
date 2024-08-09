# CookieNvim

**_v4.0.0_**

Welcome to the CookieNvim; A Personal Development Environment (PDE) Neovim configuration for HonsonCooky.

## Configuration Overview

Neovim is a configurable text editor. Coming from a world of "specific" and "generic" IDEs, this is quite a mindset
shift. Specific IDEs (like the JetBrains Suite or Visual Studio) are generally built to install everything you need out
of the box. They're designed with a specific workflows and languages in mind, so they're able to install all the tools
you'll need from the get go. Generic IDEs (like VSCode) are more lightweight out of the box but can be easily extended
to support a wide array of languages. However, the catch here is that you'll need to setup any language support on your
system first. For example, Rust must be installed on your system before the Rust extension in VSCode will work properly.

Neovim on the other hand, is not an IDE at all. It can be configured with IDE tools, but it is not an IDE in itself. So,
why use Neovim at all? For me (and that's important), I prefer keyboard centric computer interactions. Keeping my
fingers on the home-row using a split, low-profile, low-resistance, concave keyboard with flashed firmware enabling
layers for reduced stretching and wrist movement \*deep breath\* enables me to reduce friction between my brain and the
tool (and plays a lot nicer with some of my unique physical disabilities). Neovim is more than an IDE for me. It's
become my go to means for computer interactions (with the help of terminals and CLIs).

In saying all this, it has taken me some time to truly understand how to configure my Neovim setup. Being a generic
text-editor, I first attempted to re-create VSCode as this felt relatively natural. Extensions like `Mason` and
`TreeSitter` allowed me to install language server extensions on the go. I could have an inbuilt terminal with
`ToggleTerm`, and a file explorer with `Neo-Tree` or `Nvim-Tree`. So, it only made sense at the time (v1.0.0) to design
a configuration that was as "VSCode" like as possible. I played around with some community configurations as well
(`AstroNvim`, `LunarVim`, etc). However, building a VSCode like configuration for Neovim seems to be counter-intuitive.
You run into more problems than solutions, and it feels like you end up with a really bloated IDE, full of features
you're not using.

With this insight, v4.0.0 of this configuration will attempt to do the opposite. Rather than implementing a "generic"
IDE, I'm going to try build a configuration that matches Visual Studio. Why Visual Studio: Where I live, most
programming jobs are using Microsoft tool-kits. C# and TypeScript are the dominant languages in this arena, so I'm going
to build a configuration that allows me to work in this environment. This is also why I've built my configurations for
Windows OS support; Where necessary keybindings will avoid `Windows Terminal` clashes and PowerShell will be set as the
inline terminal interface.

## Supported Kits

Visual Studio is the inspiration for this configuration. My configuration enables SDK support (Highlighting,
Autocompletion, Formatting, and Debugging where applicable) for the following languages and frameworks.

### Visual Studio

- .NET

  - C#
  - F#
  - ASP.NET
  - Razor / Blazor

- Microsoft C++

  - C++

- NodeJS

  - HTML/CSS
  - TypeScript

- Others
  - Python
  - SQL
  - PowerShell
  - Markdown
  - JSON

### Extras

- Bash: For Linux Support.
- Lua: Neovim Configuration.
- Terraform: A commonly used IaC language.
