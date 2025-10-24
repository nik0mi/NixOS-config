{ pkgs, ... }:

{
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
