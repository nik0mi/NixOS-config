{ ... }:

{
  imports = [
    ./fuzzel/fuzzel.nix
    ./niri/niri.nix
    ./waybar/waybar.nix
    ./mako/mako.nix

    ../common/home-manager-modules-common.nix
  ];
}
