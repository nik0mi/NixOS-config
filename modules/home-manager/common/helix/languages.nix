{ pkgs, ... }:

{

  programs.helix.languages = {
    language-server = {
      pylsp = {
        command = "${pkgs.python3Packages.python-lsp-server}/bin/pylsp";
      };
    };
    language = [
      {
        name = "python";
        auto-format = true;
        formatter = {
          command = "${pkgs.black}/bin/black";
          args = [
            "--quiet"
            "-"
          ];
        };
        language-servers = [ "pylsp" ];
      }
    ];
  };
  home.packages = with pkgs; [
    #JSON
    vscode-json-languageserver

    #CSS
    vscode-css-languageserver

    #BASH
    bash-language-server

    #CSHARP
    omnisharp-roslyn
    netcoredbg

    #NIX
    nil
    nixd

    #PYTHON
    # ty
    # ruff
    black
    # jedit
    python313Packages.python-lsp-server
    (python3.withPackages (
      ps: with ps; [
        tkinter
      ]
    )) # python313Packages.jedi
    # python313Packages.tkinter
    # python313Packages.mathutils
  ];
}
