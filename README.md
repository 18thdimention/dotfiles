# Dotfiles

start by cloning repo and `stow .`

## Machines
- MacBook Pro M2 Max (MacOS)
- Thinkpad t480s (Arch Linux)

## What's on it
- Theme: Vague, mfk
- Editor: Neovim
- Env: Sway

# Instructions for first installation
## Basic setup
1. `$ git clone git@github.com:18thdimention/dotfiles.git`
2. `$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
3. `$ brew install git`

## NIX
5. `$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)`
6. `darwin-rebuild switch --flake .#doyeon`

