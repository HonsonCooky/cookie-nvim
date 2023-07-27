# Install scoop if it doesn't already exist
if (!(Get-Command -Name "scoop" -ErrorAction SilentlyContinue))
{
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
    "gh",
    "lazygit",
    "JetBrainsMono-NF-Mono",
    "make", 
    "ripgrep",
    "tree-sitter",

    # C / C++
    "mingw",

    # CSharp
    "dotnet-sdk",
    "nuget",

    # Lua
    "lua",
    "lua-language-server",

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
foreach ($package in $ensure_installed)
{
    if ($installed -notlike "*$package*")
    {
        Write-Output "$package installation not found...";
        scoop install $package;
    } else
    {
        $package_details = scoop info $package | Out-String
        Write-Output "$package already installed: `n$package_details"
    }
}

$Env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

dotnet tool install --global csharp-ls
rustup toolchain install stable-x86_64-pc-windows-gnu
rustup default stable-x86_64-pc-windows-gnu

# Install Catppuccin theme for PowerShell
if (!(Test-Path -Path $HOME\Documents\PowerShell\Modules\Catppuccin))
{
    git clone https://github.com/catppuccin/powershell $HOME\Documents\PowerShell\Modules\Catppuccin
}

$CookieProfile = [IO.File]::ReadAllText("$Env:LOCALAPPDATA\nvim\windows-theme-management\Microsoft.PowerShell_profile.ps1")
$CurProfile = [IO.File]::ReadAllText($PROFILE)

if ($CurProfile -notlike "*Import-Module Catppuccin*")
{
    $ParamsSig = "param(`$Theme)"
    $Content = $ParamsSig + $CurProfile + $CookieProfile
    Set-Content -Path $PROFILE -Value $Content
}

