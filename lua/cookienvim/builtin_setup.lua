--[[GLOBAL]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.number = true

--[[OPTIONS]]
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 12
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 100
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

--[[AUTOMATIONS]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

--[[POWERSHELL TERMINAL]]
if string.find(string.lower(vim.loop.os_uname().sysname), "windows") ~= nil then
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = ""
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end
