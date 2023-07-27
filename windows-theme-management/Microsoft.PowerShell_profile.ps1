# Import the module
Import-Module Catppuccin

# Set a flavor for easy access
if ($null -eq $Theme)
{
    $AppsLightThemeReg = Get-ItemPropertyValue -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme
} elseif ($Theme -eq "Light")
{
    $AppsLightThemeReg = 1

} else
{
    $AppsLightThemeReg = 0

}
if ($AppsLightThemeReg -eq 1)
{
    $Flavor = $Catppuccin['Latte']
} else
{
    $Flavor = $Catppuccin['Mocha']
}


function prompt
{
    try
    {
        # PowerShell 7.2+
        $Reset = $($PSStyle.Reset)
    } catch
    {
        try
        {
            # PowerShell 6.0 -> 7.1
            $Reset = "`e[0m"
        } catch
        {
            $Reset = "$([char]27)[0m"
        }
    }

    $(if (Test-Path variable:/PSDebugContext)
        { "$($Flavor.Red.Foreground())[DBG]: " 
        } else
        { '' 
        }) + "$($Flavor.Teal.Foreground())PS $($Flavor.Yellow.Foreground())" + $(Get-Location) +
    "$($Flavor.Green.Foreground())" + $(if ($NestedPromptLevel -ge 1)
        { '>>' 
        }) + '> ' + $Reset
}

$Colors = @{
    # Powershell colours
    ContinuationPrompt     = $Flavor.Teal.Foreground()
    Emphasis               = $Flavor.Red.Foreground()
    Selection              = $Flavor.Surface0.Background()
	
    # PSReadLine prediction colours
    InlinePrediction       = $Flavor.Overlay0.Foreground()
    ListPrediction         = $Flavor.Mauve.Foreground()
    ListPredictionSelected = $Flavor.Surface0.Background()

    # Syntax highlighting
    Command                = $Flavor.Blue.Foreground()
    Comment                = $Flavor.Overlay0.Foreground()
    Default                = $Flavor.Text.Foreground()
    Error                  = $Flavor.Red.Foreground()
    Keyword                = $Flavor.Mauve.Foreground()
    Member                 = $Flavor.Rosewater.Foreground()
    Number                 = $Flavor.Peach.Foreground()
    Operator               = $Flavor.Sky.Foreground()
    Parameter              = $Flavor.Pink.Foreground()
    String                 = $Flavor.Green.Foreground()
    Type                   = $Flavor.Yellow.Foreground()
    Variable               = $Flavor.Lavender.Foreground()
}

# Set the colours
Set-PSReadLineOption -Colors $Colors


try
{
    $PSStyle.Formatting.Debug = $Flavor.Sky.Foreground()
    $PSStyle.Formatting.Error = $Flavor.Red.Foreground()
    $PSStyle.Formatting.ErrorAccent = $Flavor.Blue.Foreground()
    $PSStyle.Formatting.FormatAccent = $Flavor.Teal.Foreground()
    $PSStyle.Formatting.TableHeader = $Flavor.Rosewater.Foreground()
    $PSStyle.Formatting.Verbose = $Flavor.Yellow.Foreground()
    $PSStyle.Formatting.Warning = $Flavor.Peach.Foreground()
} catch
{
    Write-Host "Not using PWSH 7.2+"
}
