{ config, pkgs, inputs, ... }:

{
  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
  
  programs.git = {
  	enable = true;
  	userName = "nik0mi";
  	userEmail = "dertonov@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.file."/.config/hypr" = {
    source = ../dots/hypr;
    recursive = true;
  };

  home.sessionVariables = {
  };

  wayland.windowManager.hyprland ={
    enable = true;

    plugins = with pkgs.hyprlandPlugins; [
      hyprscrolling
    ];
  };

  programs.home-manager.enable = true;
}
