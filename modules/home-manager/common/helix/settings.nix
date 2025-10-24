{ ... }:

{
  stylix.targets.helix.enable = false;

  programs.helix.settings.theme = "everforest_dark";
  programs.helix.settings.editor = {
    popup-border = "all";
    continue-comments = false;
    end-of-line-diagnostics = "error";

    file-picker.hidden = false;

    cursor-shape.normal = "bar";
    cursor-shape.insert = "bar";
    cursor-shape.select = "bar";

    bufferline = "multiple";
  };
}
