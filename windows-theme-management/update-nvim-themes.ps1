$theme = $args[0]
$pipes = get-childitem \\.\pipe\ -Filter "*nvim.*"

foreach($pipe in $pipes)
{
        nvim --headless --server $pipe --remote-send "<C-\><C-N>:set bg=$theme<CR>:mode<CR>" -ErrorAction stop
}
