{ ... }:

{
  imports = [
    ./mpd/mpd.nix
    ./udiskie/udiskie.nix
    ./zellij/zellij.nix
    ./helix/helix.nix
    ./btop/btop.nix
    ./fish/fish.nix
    ./yazi/yazi.nix
    ./git/git.nix
    ./flameshot/flameshot.nix
    ./satty/satty.nix
    ./fuzzel/fuzzel.nix
    ./niri/niri.nix
    ./mako/mako.nix
  ];

  services.hyprpolkitagent.enable = true;
}
