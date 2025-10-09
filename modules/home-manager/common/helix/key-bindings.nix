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
        ":sh rm -f /tmp/unique-file"
        ":insert-output yazi --chooser-file=/tmp/unique-file"
        ":insert-output echo \"\x1b[?1049h\x1b[?2004h\" > /dev/tty"
        ":open %sh{cat /tmp/unique-file}"
        ":redraw"
        ":set mouse false"
      ];
    };
  };
}
