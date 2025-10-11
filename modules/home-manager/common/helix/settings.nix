{ ... }:

{

  programs.helix.settings.editor = {
    popup-border = "all";
    continue-comments = false;
    end-of-line-diagnostics = "hint";

    file-picker.hidden = false;

    lsp.display-inlay-hints = true;

    soft-wrap.enable = true;

    inline-diagnostics.cursor-line = "error";
  };
}
