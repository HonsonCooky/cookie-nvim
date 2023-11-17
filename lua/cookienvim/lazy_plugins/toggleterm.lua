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

    term.setup({
      shade_terminals = false,
      shell = vim.o.shell,
      direction = 'horizontal',
    })

    -- Follow directory on change
    vim.api.nvim_create_autocmd("DirChanged", {
      callback = function()
        -- list current buffers
        local buffers = vim.api.nvim_list_bufs()

        -- check if toggleterm buffer exists. If not then create one by vim.cmd [[ exe 1 . "ToggleTerm" ]]
        local toggleterm_exists = false
        for _, buf in ipairs(buffers) do
          local buf_name = vim.api.nvim_buf_get_name(buf)
          if buf_name:find("toggleterm#") then
            toggleterm_exists = true
            break
          end
        end

        if (toggleterm_exists) then
          local cwd = vim.loop.cwd()
          vim.cmd("TermExec cmd=\"cd " .. cwd .. "; cls;\"")
        end
      end
    })
  end
}
