{ ... }:

{
  programs.satty.enable = true;
  programs.satty.settings = {
    general = {
      early-exit = true;
      fullscreen = true;
      initial-tool = "brush";
      copy-command = "wl-copy";
      actions-on-escape = [
        "save-to-clipboard"
        "exit"
      ];
    };
  };
}
