{ ... }:

{
  imports = [
    ./rmpc/rmpc.nix
    ./helix/helix.nix
    ./btop/btop.nix
    ./fish/fish.nix
    ./yazi/yazi.nix
    ./git/git.nix
  ];

  services.hyprpolkitagent.enable = true;
}
