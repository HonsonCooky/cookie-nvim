$pipes = Get-ChildItem \\.\pipe\ -Filter "*nvim.*"
foreach($pipe in $pipes)
{
        nvim --headless --server $pipe --remote-send "<C-\><C-N>:lua require(`"cookienvim.thememod`").theme_handle()<CR>" -ErrorAction stop
}
