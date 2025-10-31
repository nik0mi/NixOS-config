{ ... }:

{
  stylix.targets.helix.enable = false;

  programs.helix.settings.theme = "everforest_dark";
  programs.helix.settings.editor = {
    popup-border = "all";
    continue-comments = false;

    end-of-line-diagnostics = "hint";
    inline-diagnostics.cursor-line = "warning";
    inline-diagnostics.max-diagnostics = 1;

    file-picker.hidden = false;

    cursor-shape.normal = "bar";
    cursor-shape.insert = "bar";
    cursor-shape.select = "bar";

    bufferline = "multiple";

    auto-save.after-delay.enable = true;

    auto-save.after-delay.timeout = 500;
  };
}
