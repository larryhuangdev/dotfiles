$packageIDs = @(
    "Microsoft.PowerShell",
    "Microsoft.VisualStudioCode",
    "Starship.Starship",
    "Docker.DockerDesktop",
    "nepnep.neofetch-win"
)

foreach ($packageID in $packageIDs) {
    Write-Output "Installing $packageID..."
    winget install --id $packageID --exact
}
