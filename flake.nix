{
  description = "BuryOS Swaylock configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {

    nixosModules.default = { pkgs, ... }: {
      environment.sessionVariables = rec {
        BURYOS_SHELL_LOCK = "swaylock";
      };
    };

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
