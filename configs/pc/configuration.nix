{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/pc/nix-pc.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "ovce" = import ./home.nix; };
  };
}
