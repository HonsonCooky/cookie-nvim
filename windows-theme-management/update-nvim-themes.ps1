$(foreach($pipe in ())
        { nvim --headless --server $pipe --remote-send "<C-\><C-N>:lua require(`"cookienvim.thememod`").theme_handle()<CR>" -ErrorAction stop 
        })

Get-ChildItem \\.\pipe\ -Filter "*nvim.*" | ForEach-Object -Process {nvim --headless --server $_ --remote-send "<C-\><C-N>:lua require(`"cookienvim.thememod`").theme_handle()<CR>" }
