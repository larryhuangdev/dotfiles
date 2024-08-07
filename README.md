# Get started

## Install Windows 11

## Install apps

```
winget source update
winget install -e --id Microsoft.PowerShell
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Git.Git
```

## Install configs

```
git clone --depth 1 https://github.com/larryhuangdev/dotfiles.git
cd dotfiles
.\update.ps1
```

## Install fonts

```
git clone --depth 1 --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
.\install.ps1 JetBrainsMono
```

## Optional: Install VS Code extensions

```
code --install-extension hoovercj.vscode-settings-cycler 
code --install-extension Catppuccin.catppuccin-vsc-pack
```

## Resources

- [https://winget.run/](https://winget.run/)
- [https://github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
