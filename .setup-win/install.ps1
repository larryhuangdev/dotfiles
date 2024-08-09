$packageIDs = @(
    "Microsoft.PowerShell",
    "Microsoft.VisualStudioCode",
    "Starship.Starship",
    "gerardog.gsudo",
    "nepnep.neofetch-win"
)

foreach ($packageID in $packageIDs) {
    Write-Output "Installing $packageID..."
    winget install --exact --id $packageID
}
