# This file will overwrite the font colors in pwsh.
# Neovim themes don't change these colors, so sometimes they can clash.
# As such, running this script with the 'change theme' function will ensure 
# font colors are readable
param(
    [Parameter(Mandatory)]
    [string]$theme
)

$light = @{
    Command                  = $PSStyle.Foreground.FromRGB(0x7287fd)
    Comment                  = $PSStyle.Foreground.FromRGB(0x40a02b)
    ContinuationPrompt       = $PSStyle.Foreground.FromRGB(0x7287fd)
    Default                  = $PSStyle.Foreground.FromRGB(0x7287fd)
    Emphasis                 = $PSStyle.Foreground.FromRGB(0x7287fd)
    Error                    = $PSStyle.Foreground.FromRGB(0xd20f39)
    InlinePrediction         = $PSStyle.Foreground.FromRGB(0x4c4f69)
    Keyword                  = $PSStyle.Foreground.FromRGB(0x40a02b)
    ListPrediction           = $PSStyle.Foreground.FromRGB(0x40a02b)
    Member                   = $PSStyle.Foreground.FromRGB(0x8839ef)
    Number                   = $PSStyle.Foreground.FromRGB(0xfe640b)
    Operator                 = $PSStyle.Foreground.FromRGB(0x4c4f69)
    Parameter                = $PSStyle.Foreground.FromRGB(0x4c4f69)
    String                   = $PSStyle.Foreground.FromRGB(0xfe640b)
    Type                     = $PSStyle.Foreground.FromRGB(0xfe640b)
    Variable                 = $PSStyle.Foreground.FromRGB(0x8839ef)
    ListPredictionSelected   = $PSStyle.Background.FromRGB(0x4c4f69)
    Selection                = $PSStyle.Background.FromRGB(0x04a5e5)
}

$dark = @{
    Command                  = $PSStyle.Foreground.FromRGB(0x89b4fa)
    Comment                  = $PSStyle.Foreground.FromRGB(0x40a02b)
    ContinuationPrompt       = $PSStyle.Foreground.FromRGB(0x89b4fa)
    Default                  = $PSStyle.Foreground.FromRGB(0x89b4fa)
    Emphasis                 = $PSStyle.Foreground.FromRGB(0x89b4fa)
    Error                    = $PSStyle.Foreground.FromRGB(0xeba0ac)
    InlinePrediction         = $PSStyle.Foreground.FromRGB(0xbac2de)
    Keyword                  = $PSStyle.Foreground.FromRGB(0xa6e3a1)
    ListPrediction           = $PSStyle.Foreground.FromRGB(0xa6e3a1)
    Member                   = $PSStyle.Foreground.FromRGB(0xb4befe)
    Number                   = $PSStyle.Foreground.FromRGB(0xfab387)
    Operator                 = $PSStyle.Foreground.FromRGB(0xbac2de)
    Parameter                = $PSStyle.Foreground.FromRGB(0xbac2de)
    String                   = $PSStyle.Foreground.FromRGB(0xfab387)
    Type                     = $PSStyle.Foreground.FromRGB(0xfab387)
    Variable                 = $PSStyle.Foreground.FromRGB(0xb4befe)
    ListPredictionSelected   = $PSStyle.Background.FromRGB(0xbac2de)
    Selection                = $PSStyle.Background.FromRGB(0x89b4fa)
}

if ($theme -like "*light*")
{
    Set-PSReadLineOption -Colors $light
} else
{
    Set-PSReadLineOption -Colors $dark
}
