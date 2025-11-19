{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/nixos.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "ovce" = import ./home.nix; };
  };
}
