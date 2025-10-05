{ pkgs, ... } :

{
  stylix.targets.fuzzel.enable = true;

  programs.helix = {
    enable = true;

    languages = {
      language = {
        debugger = {
          "name" = "debugpy";
          "transport" = "stdio";
          "command" = "python3";
          "args" = ["-m" "debugpy.adapter"];
        };
        debugger.templates = {
         "name" = "Launch current file";
         "request" = "launch";
         "args" = "{ program = \"{0}\" }";
        };
      };
    };
    
    settings = {
      editor = {
        line-number = "relative";

        keys.normal = {
           "C-g" =[
              ":new"
              ":insert-output lazygit"
              ":buffer-close!"
              ":redraw"];

           "C-y"= [
              ":sh rm -f /tmp/unique-file"
              ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
              ":insert-output echo \\\"\\x1b[?1049h\\x1b[?2004h\\\" > /dev/tty"
              ":open %sh{cat /tmp/unique-file}"
              ":redraw" ];
         };
      };
    };
  };

  home.packages = with pkgs; [
    #JSON
    vscode-json-languageserver

    #CSS
    vscode-css-languageserver

    #CSHARP
    omnisharp-roslyn
    netcoredbg
    
    #KDL
    kdlfmt

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
