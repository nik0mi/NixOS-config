{ ... }:

{

  programs.helix.settings.editor = {
    shell = ["fish" "-c"];
    
    popup-border = "all";
    continue-comments = false;
    end-of-line-diagnostics = "error";

    file-picker.hidden = false;

    lsp.display-inlay-hints = true;

    soft-wrap.enable = true;
  };
}
