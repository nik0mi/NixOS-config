{pkgs, config, ...}:

{
  # services.flameshot = {
  #   enable = true;
  #   package = (pkgs.flameshot.override { enableWlrSupport = true; }); # Override the package
  #   settings = {
  #     General = {
  #       useGrimAdapter = true;
  #       disabledTrayIcon = true;
  #       showStartupLaunchMessage = false;
  #       disabledGrimWarning = true; 
  #       savePath = "${config.home.homeDirectory}/Downloads/";
  #       startupLaunch=true;

  #       uiColor = "#${config.lib.stylix.colors.base0D}";
  #       contrastUiColor = "#${config.lib.stylix.colors.base04}";
  #     };
  #   };
  # };
}
