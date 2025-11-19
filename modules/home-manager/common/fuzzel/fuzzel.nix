{ lib, config, ... } :

{
  stylix.targets.fuzzel.enable = true;

  programs.fuzzel = {
    enable = true;
    
    settings = {
      border = {
        radius = 8;
        width = 2;
      };

      colors = { border = lib.mkForce "${config.lib.stylix.colors.base04}FF"; };
      
      main = lib.mkForce {
        font = "JetBrainsMonoNFM:weight=semibold:size=12";
        width = 30;
        icons-enabled = false;
        lines = 5;
        line-height = 20;
        hide-prompt = true;
      };
    };
  };
}
