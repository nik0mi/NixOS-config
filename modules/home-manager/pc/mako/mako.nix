{ config, lib, ... }:

{
  stylix.targets.mako.enable = true;
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-center";
      width = 200;
      text-alignment = "center";
      border-color = lib.mkForce "#${config.lib.stylix.colors.base06}FF";
      border-radius = 8;
      border-size = 2;
    };

    extraConfig = ''
      [urgency=normal]
      background-color=#${config.lib.stylix.colors.base00}FF
      border-color=#${config.lib.stylix.colors.base0A}FF
      text-color=#${config.lib.stylix.colors.base04}FF
    '';
  };
}
