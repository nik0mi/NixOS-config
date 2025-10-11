{ pkgs, ... }:

{
  programs.helix.settings = {
    keys.normal = {
      "C-g" = [
        ":new"
        ":insert-output lazygit"
        ":buffer-close!"
        ":redraw"
      ];

      "C-y" = [
        ":sh zellij run --floating -n 'yazi picker' -- ./yazi-picker.fish"
      ];

      "C-t" = ":sh zellij action new-pane -d down";
    };
  };
}
