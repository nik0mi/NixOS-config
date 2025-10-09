{ ... }:

{
  imports = [
    ./languages.nix
    ./key-bindings.nix
  ];

  programs.helix.enable = true;
}
