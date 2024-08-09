local M = {}

local function init_lsp_client(pattern, name, cmd, root)
    vim.api.nvim_create_autocmd('FileType', {
        pattern = pattern, -- Tip: use the ":setfiletype " nvim command, and tab through known types
        callback = function(args)
            vim.lsp.start({
                name = name,    -- "omnisharp"
                cmd = cmd,      --{ 'name-of-language-server-executable', '--option', 'arg1', 'arg2' }
                root_dir = root --vim.fs.root(args.buf, { 'setup.py', 'pyproject.toml' }),
            })
        end,
    })
end

local function windows_setup(opts)
    local lsps = opts.lsps
    for key, value in pairs(lsps) do
        print(key)
    end
end

function M.setup(opts)
    if opts.windows then
        windows_setup(opts.windows)
    end
end

return M
