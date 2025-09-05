{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations.ovce = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configs/configuration.nix

        inputs.home-manager.nixosModules.default
        
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
