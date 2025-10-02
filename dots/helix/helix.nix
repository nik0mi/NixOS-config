{ pkgs, ... } :

{
  stylix.targets.fuzzel.enable = true;

  programs.helix.enable = true;

  home.packages = with pkgs; [
    #NIX
    nil
    nixd

    #PYTHON
    ty
    ruff
    jedit
    python313Packages.python-lsp-server
    python313Packages.jedi
  ];
}
