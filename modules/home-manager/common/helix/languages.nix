{ pkgs, ... }:

{
  programs.helix.settings = {
    language-server.godot = {
      command = "nc";
      args = ["127.0.0.1" "6005"];
    };

    language = {
      name = "gdscript";
      language-servers = ["godot"];
    };
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
    ty
    ruff
    jedit
    python313Packages.python-lsp-server
    python313Packages.jedi
  ];
}
