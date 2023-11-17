# KEYBINDINGS:

Extracted using the following command:

```vim
:redir! > vim_keys.txt
:silent verbose map
:redir END
```

## Builtin

| MODE | KEYMAP | ORIGIN       | NAME             |
| ---- | ------ | ------------ | ---------------- |
| n    | Y      | Nvim builtin | `y$`             |
| x    | #      | Nvim builtin | `y?\V<C-R>"<CR>` |
| n    | &      | Nvim builtin | `:&&<CR>`        |
| x    | \*     | Nvim builtin | `y/\V<C-R>"<CR>` |

## Git Assistance

| MODE | KEYMAP    | ORIGIN                | NAME                                         |
| ---- | --------- | --------------------- | -------------------------------------------- |
| n    | y<C-G>    | Plugin: fugitive      | Yank the path to the current fugitive-object |
| n    | <Space>gh | Plugin: gitsigns.nvim | Preview [H]unk                               |
| n    | <Space>gp | Plugin: gitsigns.nvim | [P]revious Hunk                              |
| n    | <Space>gn | Plugin: gitsigns.nvim | [N]ext Hunk                                  |

## Plugin: Harpoon

| MODE | KEYMAP | ORIGIN          | NAME                  |
| ---- | ------ | --------------- | --------------------- |
| n    | <M-f>  | Plugin: harpoon | Harpoon Navigate Next |
| n    | <M-a>  | Plugin: harpoon | Harpoon Add           |
| n    | <M-d>  | Plugin: harpoon | Harpoon Navigate Prev |
| n    | <M-s>  | Plugin: harpoon | Harpoon Files         |

## Plugin: Neo-Tree (File Explorer)

| MODE | KEYMAP        | ORIGIN                | NAME                          |
| ---- | ------------- | --------------------- | ----------------------------- |
| n    | <CR>          | Plugin: neo-tree.nvim | Goto next line start          |
| n    | <Esc>         | Plugin: neo-tree.nvim | Cancel                        |
| n    | <Space>       | Plugin: neo-tree.nvim | Toggle Node                   |
| n    | <2-LeftMouse> | Plugin: neo-tree.nvim | Open                          |
| n    | <BS>          | Plugin: neo-tree.nvim | Navigate Up                   |
| n    | <C-X>         | Plugin: neo-tree.nvim | Clear Filters                 |
| n    | #             | Plugin: neo-tree.nvim | Fuzzy Sorter                  |
| n    | .             | Plugin: neo-tree.nvim | Set Root                      |
| n    | /             | Plugin: neo-tree.nvim | Fuzzy Finder                  |
| n    | <             | Plugin: neo-tree.nvim | Prev Source                   |
| n    | >             | Plugin: neo-tree.nvim | Next Source                   |
| n    | ?             | Plugin: neo-tree.nvim | Show Help                     |
| n    | A             | Plugin: neo-tree.nvim | Add Directory                 |
| n    | C             | Plugin: neo-tree.nvim | Close Node                    |
| n    | D             | Plugin: neo-tree.nvim | Fuzzy Finder Directory        |
| n    | H             | Plugin: neo-tree.nvim | Toggle Hidden                 |
| n    | P             | Plugin: neo-tree.nvim | Toggle Preview                |
| n    | R             | Plugin: neo-tree.nvim | Refresh                       |
| n    | S             | Plugin: neo-tree.nvim | Open Split                    |
| n    | [g            | Plugin: neo-tree.nvim | Prev Git Modified             |
| n    | ]g            | Plugin: neo-tree.nvim | Next Git Modified             |
| n    | a             | Plugin: neo-tree.nvim | Add                           |
| n    | c             | Plugin: neo-tree.nvim | Copy                          |
| v    | d             | Plugin: neo-tree.nvim | Delete Highlighted            |
| n    | d             | Plugin: neo-tree.nvim | Delete Selected               |
| n    | e             | Plugin: neo-tree.nvim | Toggle Auto Expand Width      |
| n    | f             | Plugin: neo-tree.nvim | Filter On Submit              |
| n    | i             | Plugin: neo-tree.nvim | Show File Details             |
| n    | l             | Plugin: neo-tree.nvim | Focus Preview                 |
| n    | m             | Plugin: neo-tree.nvim | Move                          |
| n    | oc            | Plugin: neo-tree.nvim | Order By Created              |
| n    | od            | Plugin: neo-tree.nvim | Order By Diagnostic           |
| n    | og            | Plugin: neo-tree.nvim | Ordered By Git Status         |
| n    | om            | Plugin: neo-tree.nvim | Ordered By Modified           |
| n    | on            | Plugin: neo-tree.nvim | Ordered By Name               |
| n    | os            | Plugin: neo-tree.nvim | Ordered By Size               |
| n    | ot            | Plugin: neo-tree.nvim | Ordered By Type               |
| n    | o             | Plugin: neo-tree.nvim | Show Ordered Menu             |
| n    | p             | Plugin: neo-tree.nvim | Paste From Clipboard          |
| n    | q             | Plugin: neo-tree.nvim | Close Window                  |
| n    | r             | Plugin: neo-tree.nvim | Rename                        |
| n    | s             | Plugin: neo-tree.nvim | Open In Vertical Split        |
| n    | t             | Plugin: neo-tree.nvim | Open In New Tab               |
| n    | w             | Plugin: neo-tree.nvim | Open With Window Picker       |
| v    | x             | Plugin: neo-tree.nvim | Cut Highlighted To Clipboard  |
| n    | x             | Plugin: neo-tree.nvim | Cut Selected To Clipboard     |
| v    | y             | Plugin: neo-tree.nvim | Copy Highlighted To Clipboard |
| n    | y             | Plugin: neo-tree.nvim | Copy Selected To Clipboard    |
| n    | z             | Plugin: neo-tree.nvim | Close All Nodes               |

## Plugin: Nvim-Treesitter (Text Highlighter)

| MODE | KEYMAP   | ORIGIN                  | NAME                                |
| ---- | -------- | ----------------------- | ----------------------------------- |
| n    | <Space>A | Plugin: nvim-treesitter | Swap previous @parameter.inner      |
| n    | <Space>a | Plugin: nvim-treesitter | Swap next @parameter.inner          |
| o    | []       | Plugin: nvim-treesitter | Goto previous end @class.outer      |
| x    | []       | Plugin: nvim-treesitter | Goto previous end @class.outer      |
| n    | []       | Plugin: nvim-treesitter | Goto previous end @class.outer      |
| o    | [M       | Plugin: nvim-treesitter | Goto previous end @function.outer   |
| x    | [M       | Plugin: nvim-treesitter | Goto previous end @function.outer   |
| n    | [M       | Plugin: nvim-treesitter | Goto previous end @function.outer   |
| o    | [[       | Plugin: nvim-treesitter | Goto previous start @class.outer    |
| o    | [m       | Plugin: nvim-treesitter | Goto previous start @function.outer |
| x    | [m       | Plugin: nvim-treesitter | Goto previous start @function.outer |
| n    | [m       | Plugin: nvim-treesitter | Goto previous start @function.outer |
| x    | [[       | Plugin: nvim-treesitter | Goto previous start @class.outer    |
| n    | [[       | Plugin: nvim-treesitter | Goto previous start @class.outer    |
| o    | ]M       | Plugin: nvim-treesitter | Goto next end @function.outer       |
| x    | ]M       | Plugin: nvim-treesitter | Goto next end @function.outer       |
| n    | ]M       | Plugin: nvim-treesitter | Goto next end @function.outer       |
| o    | ][       | Plugin: nvim-treesitter | Goto next end @class.outer          |
| x    | ][       | Plugin: nvim-treesitter | Goto next end @class.outer          |
| n    | ][       | Plugin: nvim-treesitter | Goto next end @class.outer          |
| o    | ]m       | Plugin: nvim-treesitter | Goto next start @function.outer     |
| x    | ]m       | Plugin: nvim-treesitter | Goto next start @function.outer     |
| n    | ]m       | Plugin: nvim-treesitter | Goto next start @function.outer     |
| o    | ]]       | Plugin: nvim-treesitter | Goto next start @class.outer        |
| x    | ]]       | Plugin: nvim-treesitter | Goto next start @class.outer        |
| n    | ]]       | Plugin: nvim-treesitter | Goto next start @class.outer        |

## Plugin: Telescope (Fuzzy Finder)

| MODE | KEYMAP    | ORIGIN                 | NAME              |
| ---- | --------- | ---------------------- | ----------------- |
| n    | <Space>fg | Plugin: telescope.nvim | [G]it             |
| n    | <Space>fd | Plugin: telescope.nvim | [D]iagnostics     |
| n    | <Space>fb | Plugin: telescope.nvim | [B]uffers         |
| n    | <Space>ft | Plugin: telescope.nvim | [T]ext            |
| n    | <Space>fh | Plugin: telescope.nvim | [H]elp            |
| n    | <Space>fw | Plugin: telescope.nvim | [W]ord            |
| n    | <Space>ff | Plugin: telescope.nvim | [F]iles           |
| n    | <Space>f/ | Plugin: telescope.nvim | History           |
| n    | gs        | Plugin: telescope.nvim | [S]ymbols         |
| n    | gd        | Plugin: telescope.nvim | [D]efinition      |
| n    | gi        | Plugin: telescope.nvim | [I]mplementation  |
| n    | gt        | Plugin: telescope.nvim | [T]ype Definition |
| n    | gr        | Plugin: telescope.nvim | [R]eferences      |

## LSP and Autocomplete Support

| MODE | KEYMAP    | ORIGIN                  | NAME                          |
| ---- | --------- | ----------------------- | ----------------------------- |
| n    | H         | Builtin: vim.lsp        | Signature [H]elp              |
| n    | K         | Builtin: vim.lsp.buf    | Hover Documentation           |
| s    | <Tab>     | Plugin: nvim-cmp        | cmp.utils.keymap.set_map      |
| s    | <S-Tab>   | Plugin: nvim-cmp        | cmp.utils.keymap.set_map      |
| n    | <Space>dn | Builtin: vim.diagnostic | [N]ext                        |
| n    | <Space>df | Builtin: vim.diagnostic | [F]loat                       |
| n    | <Space>dp | Builtin: vim.diagnostic | [P]revious                    |
| n    | <Space>lr | Builtin: vim.lsp        | [R]ename                      |
| n    | <Space>la | Builtin: vim.lsp        | Code [A]ction                 |
| o    | %         | Builtin: vim-matchit    | MatchitOperationForward       |
| x    | %         | Builtin: vim-matchit    | MatchitVisualForward          |
| n    | %         | Builtin: vim-matchit    | MatchitNormalForward          |
| o    | [%        | Builtin: vim-matchit    | MatchitOperationMultiBackward |
| x    | [%        | Builtin: vim-matchit    | MatchitVisualMultiBackward    |
| n    | [%        | Builtin: vim-matchit    | MatchitNormalMultiBackward    |
| o    | ]%        | Builtin: vim-matchit    | MatchitOperationMultiForward  |
| x    | ]%        | Builtin: vim-matchit    | MatchitVisualMultiForward     |
| n    | ]%        | Builtin: vim-matchit    | MatchitNormalMultiForward     |
| x    | a%        | Builtin: vim-matchit    | MatchitVisualTextObject       |
| o    | g%        | Builtin: vim-matchit    | MatchitOperationBackward      |
| x    | g%        | Builtin: vim-matchit    | MatchitVisualBackward         |
| n    | g%        | Builtin: vim-matchit    | MatchitNormalBackward         |

## Plugin: Comment.nvim (Code Commenting)

| MODE | KEYMAP | ORIGIN               | NAME                              |
| ---- | ------ | -------------------- | --------------------------------- |
| n    | gcA    | Plugin: Comment.nvim | Comment insert end of line        |
| n    | gcO    | Plugin: Comment.nvim | Comment insert above              |
| n    | gco    | Plugin: Comment.nvim | Comment insert below              |
| x    | gb     | Plugin: Comment.nvim | Comment toggle blockwise (visual) |
| x    | gc     | Plugin: Comment.nvim | Comment toggle linewise (visual)  |
| n    | gbc    | Plugin: Comment.nvim | Comment toggle current block      |
| n    | gcc    | Plugin: Comment.nvim | Comment toggle current line       |
| n    | gb     | Plugin: Comment.nvim | Comment toggle blockwise          |
| n    | gc     | Plugin: Comment.nvim | Comment toggle linewise           |

## Custom: My Implementations (Code Commenting)

| MODE | KEYMAP    | ORIGIN              | NAME                    |
| ---- | --------- | ------------------- | ----------------------- |
| v    | <         | Custom: cookie-nvim | Indent Decrease         |
| v    | >         | Custom: cookie-nvim | Indent Increase         |
| n    | J         | Custom: cookie-nvim | Fancy Line Pull         |
| n    | <Tab>     | Custom: cookie-nvim | Next Tab                |
| n    | <S-Tab>   | Custom: cookie-nvim | Prev Tab                |
| v    | <M-j>     | Custom: cookie-nvim | Move Line Down          |
| v    | <M-k>     | Custom: cookie-nvim | Move Line Up            |
| n    | <M-k>     | Custom: cookie-nvim | Move Line Down          |
| n    | <M-j>     | Custom: cookie-nvim | Move Line Up            |
| n    | <C-D>     | Custom: cookie-nvim | Half Page Down Centered |
| n    | <C-U>     | Custom: cookie-nvim | Half Page Up Centered   |
| n    | <C-k>     | Custom: cookie-nvim | Jump To Windows UP      |
| n    | <C-j>     | Custom: cookie-nvim | Jump To Windows DOWN    |
| n    | <C-h>     | Custom: cookie-nvim | Jump To Windows LEFT    |
| n    | <C-l>     | Custom: cookie-nvim | Jump To Windows RIGHT   |
| n    | <C-Up>    | Custom: cookie-nvim | Window Increase Height  |
| n    | <C-Down>  | Custom: cookie-nvim | Window Decrease Height  |
| n    | <C-Left>  | Custom: cookie-nvim | Window Decrease Width   |
| n    | <C-Right> | Custom: cookie-nvim | Window Increase Width   |
| n    | <C-A>     | Custom: cookie-nvim | Highlight [A]ll         |
| n    | <C-.>     | Custom: cookie-nvim | Increase Font Size      |
| n    | <C-,>     | Custom: cookie-nvim | Decrease Font Size      |
| n    | <C-`>     | Custom: cookie-nvim | Open Terminal           |
| n    | <Space>lw | Custom: cookie-nvim | [W]rap                  |
| n    | <Space>q  | Custom: cookie-nvim | [Q]uit                  |
| n    | <Space>tl | Custom: cookie-nvim | Theme [L]ight           |
| n    | <Space>td | Custom: cookie-nvim | Theme [D]ark            |
| n    | <Space>tt | Custom: cookie-nvim | Theme [T]elescope       |
| n    | <Space>r  | Custom: cookie-nvim | [R]eload Buffer         |
| n    | <Space>w  | Custom: cookie-nvim | [W]rite All             |
| n    | <Space>lf | Custom: cookie-nvim | LSP [F]ormat            |
| n    | <Space>gg | Custom: cookie-nvim | Lazy[G]it               |
| n    | <Space>ds | Custom: cookie-nvim | [S]pell Check Toggle    |
| n    | <Space>e  | Custom: cookie-nvim | File [E]xplorer         |

## Plugin: WhichKey Trigger (Nested Options)

| MODE | KEYMAP  | ORIGIN                 | NAME                            |
| ---- | ------- | ---------------------- | ------------------------------- |
| n    | <Space> | Action: which-key.show | Leader                          |
| n    | "       | Action: which-key.show | Registers                       |
| x    | "       | Action: which-key.show | Registers                       |
| n    | '       | Action: which-key.show | Marks                           |
| n    | `       | Action: which-key.show | Marks                           |
| n    | <       | Action: which-key.show | Indent Left                     |
| n    | >       | Action: which-key.show | Indent Right                    |
| n    | !       | Action: which-key.show | Filter Through External Program |
| n    | [       | Action: which-key.show | Prev Block Navigation           |
| x    | [       | Action: which-key.show | Prev Block Navigation           |
| n    | ]       | Action: which-key.show | Next Block Navigation           |
| x    | ]       | Action: which-key.show | Next Block Naviagation          |
| n    | c       | Action: which-key.show | Change                          |
| n    | d       | Action: which-key.show | Delete                          |
| n    | g       | Action: which-key.show | [G]oto                          |
| x    | g       | Action: which-key.show | [G]oto                          |
| n    | y       | Action: which-key.show | Yank                            |
| n    | v       | Action: which-key.show | Visual Char Mode                |
| n    | z       | Action: which-key.show | Block Foldering                 |
| n    | <C-W>   | Action: which-key.show | Window Options                  |
