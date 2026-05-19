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
7. 
Use Lix but darwin is not installed by default
To use Nixpkgs unstable: `$ sudo nix run nix-darwin/master#darwin-rebuild -- switch`
To use Nixpkgs 25.11: `$ sudo nix run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch`

`$ sudo nix run nix-darwin/master#darwin-rebuild -- switch --extra-experimental-features "nix-command flakes"`
`$ sudo nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/dotfiles/nix`
