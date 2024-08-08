#Requires -RunAsAdministrator

$APPDATA = [System.Environment]::GetFolderPath('ApplicationData')
$DOTDIR = Split-Path -Path (Get-Location).Path -Parent

$configMap = @(
    @{
        Path = "$HOME\.gitconfig",
        Target = "$DOTDIR\git\.gitconfig"
    },
    @{
        Path = "$APPDATA\Code\User\keybindings.json",
        Target = "$DOTDIR\vscode\keybindings.json"
    }
)

# Function to set symbolic link
function Set-Symlink {
    param (
        [string]$Path,
        [string]$Target
    )

    if (Test-Path $Path) {
        # Check if the existing item is a symbolic link
        $item = Get-Item $Path
        if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
            Write-Output "Removing the existing symlink $Path"
            Remove-Item $Path
        }
        else {
            # Generate new name with epoch timestamp
            $epochTime = [int][double]::Parse((Get-Date -UFormat %s))
            $newName = "$Path.old.$epochTime"
            # Rename the existing file or directory
            Write-Output "Conflict detected: $Path already exists. Renaming to $newName"
            Rename-Item -Path $Path -NewName $newName
        }
    }

    New-Item -ItemType SymbolicLink -Path $Path -Target $Target
}

# Link configs
foreach ($config in $configMap) {
    Set-Symlink -Path $config.Path -Target $config.Target
}