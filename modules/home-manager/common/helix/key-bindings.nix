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
        #   ":sh rm -f /tmp/unique-file"
        #   ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
        #   ":insert-output echo \"\x1b[?1049h\x1b[?2004h\" > /dev/tty"
        #   ":open %sh{cat /tmp/unique-file}"
        #   ":redraw"
      ];
    };
  };
}
