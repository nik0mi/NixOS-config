{ ... }:

{
  imports =
  [
    ./pc-pkgs.nix
    ./grub.nix
    ./nvidia.nix 
    ./steam.nix

    ../common/nix-modules-common.nix
  ];
}
