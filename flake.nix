{
  description = "Nixos system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = { self, nixpkgs, nix-alien }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [ ./configuration.nix ];
    };

    nixosConfigurations.nix-alien-desktop = nixpkgs.lib.nixosSystem rec {
      system = "aarch64-linux"; # or aarch64-linux
      specialArgs = { inherit self system; };
      modules = [
        ({ self, system, ... }: {
          environment.systemPackages = with self.inputs.nix-alien.packages.${system}; [
            nix-alien
          ];
          # Optional, needed for `nix-alien-ld`
          programs.nix-ld.enable = true;
        })
      ];
    };
  };
}

