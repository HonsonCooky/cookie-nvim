-- I'll be the first to admit, these functions are all fairly small and silly.
-- BUT, they all took me way too long to figure out, so I saved them here for future me
local M = {}

function M.reload_buffer()
  vim.cmd("e!")
end

function M.format()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end

-- Format the document, then save the format
function M.format_and_save()
  vim.cmd "stopinsert"
  M.format()
  vim.cmd "wa"
end

-- Format and save, then quit
function M.safe_quit()
  pcall(M.format_and_save)
  vim.cmd "q"
end

-- Format and save, then quit all
function M.safe_quit_all()
  pcall(M.format_and_save)
  vim.cmd "qa"
end

-- Format and save, then force quit
function M.force_safe_quit()
  pcall(M.format_and_save)
  vim.cmd "q!"
end

-- Close the current window
function M.close_window()
  pcall(function()
    vim.cmd "close"
  end)
end

-- Toggle wrap
function M.toggle_wrap()
  if vim.o.wrap then
    vim.o.textwidth = 0
    vim.o.wrap = false
    vim.o.colorcolumn = ""
  else
    vim.o.textwidth = 120
    vim.o.wrap = true
    vim.o.colorcolumn = "121"
  end
end

function M.toggle_spell()
  vim.opt_local.spell = not vim.opt_local.spell:get()
  vim.cmd("mode")
  print("Spell check is " .. (vim.opt_local.spell:get() and "on" or "off"))
end

-- Determine the current os
function M.is_windows_os()
  return string.find(string.lower(vim.loop.os_uname().sysname), "windows") ~= nil
end

-- Print Table
function M.dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

return M
