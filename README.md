# CookieNvim

**_v2.0.0_**

Welcome to the CookieNvim; A Personal Development Environment (PDE) Neovim configuration for HonsonCooky.

## Design

This Neovim configuration is designed around three key concepts:

- **_Static UI_**: The following diagram demonstrates the UI layout. Both the `File Manager` and `Terminal` are
  extension windows that can be toggled with keyboard shortcuts. Version 1.0.0 of my configuration attempted to
  overcomplicate this design, with additional information and layouts. However, I know how I operate, and the following
  design allows for me to access the information I need, when I need it, without making large distractions from my code
  in the middle.

```
|-----------------------------------|
|   Code Window           | File    |
|                         | Manager |
|   Can split hori/vert   |         |
|                         |         |
|                         |         |
|-----------------------------------|
|   Terminal                        |
|-----------------------------------|
```

- **_Concept File Management_**: As I was learning to build my Neovim configuration, I was taught to use a file
  structure that I found to be convoluted and excessive, making my config hard to manage. These tips would be great for
  those building Neovim extension plugins, but for my configuration, I've opted to reduced the number of files. As such,
  each file represents some concept to my PDE.

  - `./lua/cookienvim/custom_keymaps.lua`: Global keybindings that aid my development. In cases where a plugin can
    have it's keybindings customized (and don't come with defaults), I setup the plugin with the example bindings from
    it's documentation. This allows me to refer back to the documentation until I have learnt what they are.

  - `./lua/cookienvim/language_features.lua`: IDE's excel over text editors mostly due to their integrations with
    LSPs. Autocomplete and other langauge specific features are setup and managed in this file. Occasionally, there is
    some cross-over between plugins (like connecting an AutoComplete engine to your LSP). Having these two setups
    exist in the same file allows for a much easier time seeing how each plugin interacts with one another.

  - `./lua/cookienvim/plugin_manager.lua`: I use `lazy.nvim` as my Neovim plugin manager. I don't utilize any of the
    "lazy" features, I just find it the easiest to setup and use. This file DOES NOT setup any of the plugins, rather,
    it lists them all out in an easy to read manner. Code comments are used to identify sections and concepts.

  - `./lua/cookienvim/user_interface.lua`: There are several tools that can exist under the "User Interface" category,
    and this is where they all are setup. The only requirement for a plugin to be considered a "User Interface"
    feature, it that it's designed to show the user (me) some information in a nicer way. Color schemes and fonts are
    faily obvious choices for this category, but it also includes the File Manager, Terminal and RipGrep search tools
    that all provide some element to my user interface that is purely for providing extra information. LSPs could
    technically go in this category, but I've put language features in their section due to their complicated nature.

  - `./lua/cookienvim/vim_setup.lua`: Vim as a tool (and Neovim by extension) comes with many settings and variables
    that can be altered to customize your experience. In this file, those settings are setup. Fairly simple.

  - `./init.lua`: Typically, this file is only used to reference some internal `init.lua` inside your config; But Why?
    This isn't a plugin, it's a configuration. So, given this is the starting point for your Neovim setup, there's no
    reason why the file itself cannot act as an orchestrator, calling upon your `.lua` files in the correct setup
    order. That's precisely what I have done here.

- **_Language Tools on the fly_**: One of the slowest parts of any configuration setup, is the installation of
  Treesitter and LSP languages. This creates a rather annoying problem when you want your configuration to be versatile
  enough to be used in remote servers, or GitHub Codespaces. Rather than trying to predict every language you may or may
  not use, it's far easier to simply install them on the fly, when they become necessary. I have included a small list
  of languages I would like to setup. This is mostly due to either their link to my Neovim setup (thus, if I need to
  make changes, I should be able to do so anywhere), or their likelihood to be a pre-existing language on a device
  (Linux comes with C and Rust).

## Windows First Thinking

As a working developer, my work operating system is not something I have a large amount of control over. Often, large
companies opt to utilize Windows for the administrative control that enables a security team to ensure company data and
systems are not hacked. In version 1.0.0 of this configuration, I attempted to setup some common command line
instructions to key bindings, as a means of saving time. However, this endeavour ultimately created issues when I
switched to a Linux environment.

Furthermore, version 1.0.0 of this configuration also attempted to create some installation scripts, that would ensure
tools are installed for my configuration to work. Ultimately, this was incredibly hard to manage and maintain across
multiple OSs as my toolkit changed and updated.

My thinking in this space changed, where previously I had thought of my Neovim configuration being the center component
to my OS; Now it's an accessory to my system. In another GitHub [repo](https://github.com/honsonCooky/dotfiles), I have
dedicated scripts and files that are essential to recreating my ideal setup. The OS centric view now treats this Neovim
configuration as an accessory to the OS, rather than the configuration being the center of my setup.

This change in thinking is replicated in my configuration, where it is assumed that the tools necessary for the
configuration to work, are already installed. There are no checks or additional logic that ensure the configuration will
work.

Overall, this new view on my configuration has simplified this setup, and also allowed my CLI skill set to vastly
improve. Where previously I might have searched up how to X in Bash / PowerShell, and then immediately implemented a key
binding to do this for me. I'm now forced to learn these tools in full, which only goes to further my abilities as a
Software Engineer. The simplification of my setup has enabled it to also be OS independant, which makes it a
cross-platform tool simply because I'm not attemtping to do anything too fancy.
