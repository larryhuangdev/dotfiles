# Opinionated Windows Setup

## Install Windows 11

## Setup Dev Environment

### Update `winget` source and install `git`

```pwsh
winget source update
winget install --exact --id Git.Git
```

### Install core packages and update configs

```pwsh
git clone --depth 1 https://github.com/larryhuangdev/dotfiles.git
cd dotfiles\.setup-win
.\install.ps1
```

Close current shell and open new with `Win+X I`

```pwsh
cd dotfiles\.setup-win
gsudo .\update.ps1
```

### Install Nerd fonts

```pwsh
git clone --depth 1 --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
.\install.ps1 JetBrainsMono
```

### Install VS Code configs

```pwsh
code --install-extension hoovercj.vscode-settings-cycler 
code --install-extension Catppuccin.catppuccin-vsc-pack
```

After installing extensions, open VS Code and use following keybinds:

1. `Ctrl+K Ctrl+I` to init and apply core settings.
2. `Ctrl+K Ctrl+Z` to toggle custom Zen mode.
