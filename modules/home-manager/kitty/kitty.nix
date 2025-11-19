{ ... } :

{
  programs.kitty = {
    enable = true;
    settings = {
      shell_integration = "no-cursor";
      cursor_shape = "block";
      window_padding_width = 10;
      window_padding_height = 10;
      scrollback_lines = 3000;
      font_size = 14;
      font_family = "JetBrainsMono Nerd Font Mono";
      bold_font = "JetBrainsMono Nerd Font Mono Bold";
    };
  };
}
