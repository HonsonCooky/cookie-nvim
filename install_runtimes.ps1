# Install scoop if it doesn't already exist
if (!(Get-Command -Name "scoop" -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser;
    Invoke-RestMethod get.scoop.sh | Invoke-Expression;
}

# Install necessary runtime environment packages
$installed = scoop list | Out-String;
$ensure_installed = @(
    "neovim", 
    "lua",

    # ETC
    "fzf",
    "lazygit",
    "JetBrainsMono-NF-Mono",
    "make", 
    "ripgrep",
    "tree-sitter",

    # C / C++
    "mingw",

    # CSharp
    "dotnet-sdk",
    "omnisharp",

    # Python
    "python",
    
    # Rust
    "rustup",

    # TypeScript + WebDev
    "nodejs-lts",
    "pnpm"
);

scoop bucket add extras 
scoop bucket add nerd-fonts
foreach ($package in $ensure_installed) {
    if ($installed -notlike "*$package*") {
        Write-Output "$package installation not found...";
        scoop install $package;
    }
    else {
        $package_details = scoop info $package | Out-String
        Write-Output "$package already installed: `n$package_details"
    }
}

$Env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")