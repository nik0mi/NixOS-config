{ ... }:

{
  imports = [
    ./mpd/mpd.nix
    ./zellij/zellij.nix
    ./helix/helix.nix
    ./btop/btop.nix
    ./fish/fish.nix
    ./yazi/yazi.nix
    ./git/git.nix
    ./flameshot/flameshot.nix
    ./satty/satty.nix
  ];

  services.hyprpolkitagent.enable = true;
}
