{ lib,... } :

{
  #home.file = {
  #  "/.config/fuzzel" = {
  #    source = ../fuzzel;
  #    recursive = true;
  #  };
  #};
  stylix.targets.fuzzel.enable = true;

  programs.fuzzel = {
    enable = true;
    
    settings = {
      border = {
        radius = 0;
        width = 3;
      };

      colors = {
        border = lib.mkForce "c7d5c0ff";
      };
      
      main = lib.mkForce {
        font = "JetBrainsMonoNFM:weight=semibold:size=12";
        width = 30;
        icons-enabled = false;
        lines = 5;
        line-height = 20;
        prompt = ''""'';
        placeholder = "...";
      };
    };
  };
}
