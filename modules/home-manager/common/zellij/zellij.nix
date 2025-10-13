{ ... }:

{
  stylix.targets.zellij.enable = false;

  xdg.configFile."zellij/layouts/helix.kdl".text = ''
     layout {
        pane {
            borderless true
            command "hx"
            args "."
        }
        pane split_direction="vertical" size="20%" {
        }
    }
  '';
  programs.zellij = {
    enable = true;
    settings = {
      theme = "everforest-dark";
      simplified_ui = true;
      show_startup_tips =  false;
    };
  };
}
