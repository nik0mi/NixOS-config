{ config, lib, ... }:

{
  stylix.targets.mako.enable = true;
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-center";
      text-alignment = "center";
      group-by = "app-name";
      format = "<b>%s</b>\\n%b";
      width = 400;
      border-radius = 8;
      border-size = 2;
      ignore-timeout = 1;
      default-timeout = 1000;
      font=lib.mkForce "JetBrainsMono Nerd Font 12";
      border-color = lib.mkForce "#${config.lib.stylix.colors.base04}ff";
      text-color = lib.mkForce "#${config.lib.stylix.colors.base04}ff";
      background-color = lib.mkForce "#${config.lib.stylix.colors.base00}ff";
    };

    #up right down left
    extraConfig = ''
      [app-name=volume]
      height=1
      outer-margin=0,0,10,0
      anchor=bottom-center
      border-radius=6
      width=250
      progress-color=source #${config.lib.stylix.colors.base04}ff
    '';
  };
}
