{ config, lib, ... } :

{
  stylix.targets.mako.enable = true;
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-center";
      width = 200;
      text-alignment = "center";
      border-color= lib.mkForce "${config.lib.stylix.colors.base07}";

      extraConfig = ''
        [urgency=normal]
        background-color=#${config.lib.stylix.colors.base00}
        border-color=#${config.lib.stylix.colors.base0A}
        text-color=#${config.lib.stylix.colors.base05}
      '';
    };
  };
}
