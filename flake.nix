{
  description = "BuryOS Swaylock configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    packages."x86_64-linux".default = nixpkgs.legacyPackages."x86_64-linux".swaylock-effects;

    # Home-manager support
    homeManagerModules.default = { pkgs, ... }: {
      home.packages = [
        pkgs.swaylock-effects
      ];

      # Bind the configuration files
      xdg.configFile."swaylock" = {
        source = ./src;
        recursive = true;
      };
    };
  };
}
