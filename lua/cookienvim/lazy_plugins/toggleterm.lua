return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local general = require('cookienvim.utilmods')
    local term = require('toggleterm')

    -- Setup Powershell for Windows environments
    if general.is_windows_os() then
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

    term.setup({ shell = vim.o.shell })
  end
}
