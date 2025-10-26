{
  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOs/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      # PC
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          pkgs-stable = nixpkgs.unstable.legacePackages.x86_64-linux;
        };
        modules = [
          ./configs/pc/configuration.nix

          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix

          inputs.zapret-discord-youtube.nixosModules.default
          {
            services.zapret-discord-youtube = {
              enable = true;
              config = "general(ALT)";
            };
          }
        ];
      };

      # LAPTOP
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configs/laptop/configuration.nix

          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
}
