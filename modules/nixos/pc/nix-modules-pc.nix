{ ... }:

{
  imports =
  [
    ./mpd.nix
    ./stylix.nix
    ./pc-pkgs.nix
    ./grub.nix
    ./greetd.nix
    ./nvidia.nix 
    ./steam.nix
    ./xdg-portals.nix

    ../common/nix-modules-common.nix
  ];
}
