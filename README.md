# BuryOS Swaylock configuration

This repository contains the Swaylock configuration for BuryOS. It uses `swaylock-effects` rather than the basic `swaylock` package.

## Usage

### Manual install

Copy or symlink the `./src` directory to `~/.config/swaylock`:

```bash
cp -r ./src ~/.config/swaylock
```

### NixOS

The flake assumes a home manager setup and symlinks the ./src directory as `~/.config/swaylock`.

Add the input to your `flake.nix`:

```nix
# flake.nix
{
  inputs = {
    bury-swaylock = {
      url = "github:bury-os/bury-swaylock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

Import bury-swaylock in your home manager config:

```nix
# home.nix
{
  imports = [
    inputs.bury-swaylock.homeManagerModules.default
  ];
}
```
