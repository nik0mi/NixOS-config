{ ... }:

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
        ":sh zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- bash ~/.config/helix/yazi-picker.sh open %{buffer_name}"
      ];
    };
  };
}
