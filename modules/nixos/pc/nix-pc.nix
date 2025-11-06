{ ... }:

{
  imports =
  [
    ./grub/grub.nix
    ./steam/steam.nix
    ./nvidia/nvidia.nix 

    ./pc-pkgs.nix
    ../common/nix-common.nix
  ];
}
