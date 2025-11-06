{ ... }:

{
  imports =
  [
    ./stylix/stylix.nix
    ./greetd/greetd.nix
    ./xdg-portals/xdg-portals.nix

    ./common-conf.nix
    ./common-pkgs.nix
  ];
}
