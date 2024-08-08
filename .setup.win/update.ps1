#Requires -RunAsAdministrator

# Define variables
$APPDATA = [System.Environment]::GetFolderPath('ApplicationData')
$DOTDIR = Split-Path -Path (Get-Location).Path -Parent

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
            # Get the current epoch timestamp
            $epochTime = [int][double]::Parse((Get-Date -UFormat %s))
            # Generate the new name with .old and epoch timestamp
            $newName = "$Path.old.$epochTime"
            # Rename the existing file or directory
            Write-Output "Conflict detected: $Path already exists. Renaming to $newName"
            Rename-Item -Path $Path -NewName $newName
        }
    }

    # Set the symbolic link
    New-Item -ItemType SymbolicLink -Path $Path -Target $Target
}

# Link configs
Set-Symlink -Path "$APPDATA\Code\User\keybindings.json" -Target "$DOTDIR\vscode\keybindings.json"
Set-Symlink -Path "$HOME\.gitconfig" -Target "$DOTDIR\git\.gitconfig"