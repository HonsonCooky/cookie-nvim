# Annoyingly, this file has to exist in the config for 'Auto Dark Mode' script to work
Get-ChildItem \\.\pipe\ -Filter '*nvim.*' | ForEach-Object -Parallel {nvim --headless --server $_ --remote-send '<C-\><C-N>:lua require("cookienvim.thememod").theme_handle()<CR>'}
