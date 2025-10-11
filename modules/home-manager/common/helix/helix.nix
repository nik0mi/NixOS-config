{ ... }:

{
  imports = [
    ./languages.nix
    ./key-bindings.nix
    ./settings.nix
  ];

  programs.helix.enable = true;
}
