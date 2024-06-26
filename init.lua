--[[
VIM SETUP
]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 100
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 20
vim.opt.hlsearch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Flash a highlight color on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--[[
LAZY SETUP
]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

--[[
PACKAGES
]]
require("lazy").setup({
	"tpope/vim-sleuth",
	"numToStr/Comment.nvim",
	"lewis6991/gitsigns.nvim",
	"folke/which-key.nvim",
	"rose-pine/neovim",
	"f-person/auto-dark-mode.nvim",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"windwp/nvim-autopairs",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"j-hui/fidget.nvim",
			"folke/neodev.nvim",
		},
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
})

--[[
POWERSHELL TERMINAL
]]
if string.find(string.lower(vim.loop.os_uname().sysname), "windows") ~= nil then -- If Windows.OS
	local powershell_options = {
		shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
		shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
		shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
		shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
		shellquote = "",
		shellxquote = "",
	}

	for option, value in pairs(powershell_options) do
		vim.opt[option] = value
	end
end

--[[
SIMPLE SETUPS
]]
require("Comment").setup()
require("gitsigns").setup()
require("nvim-autopairs").setup()
require("nvim-ts-autotag").setup()
require("todo-comments").setup({ signs = false })

--[[
LANGUAGE SERVER SETUP
]]
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"clangd",
		"csharp_ls",
		"cmake",
		"cssls",
		"html",
		"jsonls",
		"lua_ls",
		"marksman",
		"rust_analyzer",
		"terraformls",
		"tsserver",
		"vimls",
		"yamlls",
	},
})
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
	},
})

--[[
TREESITTER
]]
vim.cmd("TSUpdate")
require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"c_sharp",
		"cpp",
		"css",
		"diff",
		"html",
		"javascript",
		"lua",
		"luadoc",
		"markdown",
		"query",
		"rust",
		"typescript",
		"vim",
		"vimdoc",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "ruby" },
	},
	indent = { enable = true, disable = { "ruby" } },
})

--[[
AUTO COMPLETE
]]
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")
local luasnip = require("luasnip")
luasnip.config.setup()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = { completeopt = "menu,menuone,noinsert" },
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

--[[
FORMAT
]]
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.clang_format, -- C++
		formatting.cmake_format, -- CMake
		formatting.csharpier, -- C#
		formatting.prettier, -- HTML, JS/TS, CSS
		formatting.stylua, -- Lua
		formatting.terraform_fmt, -- Terraform
		formatting.yamlfmt, -- Yaml
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
				end,
			})
		end
	end,
})
require("mason-null-ls").setup()

--[[
NVIM TREE
]]
require("nvim-tree").setup({
	hijack_cursor = true,
	disable_netrw = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	respect_buf_cwd = true,
	select_prompts = true,
	view = {
		cursorline = false,
		side = "right",
		number = true,
		relativenumber = true,
		width = {
			min = 25,
			max = 45,
		},
	},
})

--[[
TELESCOPE
]]
require("telescope").setup({
	defaults = { initial_mode = "normal" },
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

--[[
COLOR SCHEME
]]
require("rose-pine").setup({ styles = { italic = false } })
vim.cmd.colorscheme("rose-pine")
require("auto-dark-mode").setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.o.background = "dark"
		vim.cmd("mode")
	end,
	set_light_mode = function()
		vim.o.background = "light"
		vim.cmd("mode")
	end,
})

--[[
WHICH KEY
]]
require("which-key").setup()
local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

-- NORMAL
require("which-key").register({
	["<Esc>"] = { "<cmd>nohlsearch<CR>", "Remove highlights" },

	-- Navigation
	["<C-h>"] = { "<C-w>h", "Jump To Windows LEFT" },
	["<C-j>"] = { "<C-w>j", "Jump To Windows DOWN" },
	["<C-k>"] = { "<C-w>k", "Jump To Windows UP" },
	["<C-l>"] = { "<C-w>l", "Jump To Windows RIGHT" },

	-- Window manipulations
	["<C-Up>"] = { ":resize +2<CR>", "Window Increase Height" },
	["<C-Down>"] = { ":resize -2<CR>", "Window Decrease Height" },
	["<C-Left>"] = { ":vertical resize -2<CR>", "Window Decrease Width" },
	["<C-Right>"] = { ":vertical resize +2<CR>", "Window Increase Width" },

	-- Text manipulations
	["<A-j>"] = { ":m .+1<CR>==", "Move Line Up" },
	["<A-k>"] = { ":m .-2<CR>==", "Move Line Down" },
	J = { "mzJ`z", "Fancy Line Pull" },
	K = { vim.lsp.buf.hover, "Hover" },

	-- Diagnostics
	["["] = {
		name = "Diagnostics",
		j = { vim.diagnostic.goto_next, "Next" },
		f = { vim.diagnostic.open_float, "Open [F]loat" },
		k = { vim.diagnostic.goto_prev, "Prev" },
		q = { vim.diagnostic.setloclist, "[Q]uickfix List" },
	},

	-- LSP
	g = {
		name = "LSP",
		d = { telescope_builtin.lsp_definitions, "[D]efinition" },
		D = { vim.lsp.buf.declaration, "[D]eclaration" },
		r = { telescope_builtin.lsp_references, "[R]eferences" },
		I = { telescope_builtin.lsp_implementations, "[I]mplementation" },
	},
}, { mode = "n", noremap = true })

-- LEADER NORMAL
require("which-key").register({
	w = { "<cmd>wa<CR>", "Save All" },
	e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },

	-- Search
	["<leader>"] = { telescope_builtin.buffers, "Open Buffers" },
	s = {
		name = "[S]earch",
		["."] = { telescope_builtin.oldfiles, "Recent" },
		d = { telescope_builtin.diagnostics, "[D]iagnositcs" },
		f = { telescope_builtin.find_files, "[F]ind Files" },
		g = { telescope_builtin.grep_string, "[G]rep" },
		h = { telescope_builtin.help_tags, "[H]elp" },
		k = { telescope_builtin.keymaps, "[K]eymaps" },
		r = { telescope_builtin.resume, "[R]esume" },
		s = { telescope_builtin.builtin, "[S]elect Tool" },

		-- Neovim
		n = {
			function()
				telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end,
			"[N]eovim files",
		},

		-- Grep Files
		["/"] = {
			function()
				telescope_builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			"Fuzzily search open files",
		},
	},

	-- Grep Buffer
	["/"] = {
		function()
			telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end,
		"Fuzzily search current buffer",
	},

	-- LSP
	l = {
		name = "LSP",
		a = { vim.lsp.buf.code_action, "[C]ode [A]ction" },
		d = { telescope_builtin.lsp_type_definitions, "[D]efinitions" },
		D = { telescope_builtin.lsp_document_symbols, "[D]ocument Symbols" },
		r = { vim.lsp.buf.rename, "[R]ename" },
		s = { telescope_builtin.lsp_dynamic_workspace_symbols, "Workspace [S]ymbols" },
	},

	-- Formatting
	f = {
		function()
			local filetype = vim.api.nvim_buf_get_option(0, "filetype")
			if next(vim.lsp.buf_get_clients()) ~= nil then
				vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
			else
				print("No formatter available for filetype: " .. filetype)
			end
		end,
		"[F]ormat",
	},
}, { mode = "n", prefix = "<leader>" })

-- VISUAL
require("which-key").register({}, { mode = "v" })
