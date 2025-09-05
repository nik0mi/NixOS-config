{ config, pkgs, inputs, ... }:

{
  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
  
  home.file= {
    "/.config/hypr" = {
      source = ../dots/hypr;
      recursive = true;
      force = true;
    };

    "/.config/waybar" = {
      source = ../dots/waybar;
      recursive = true;
      force = true;
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs = {
  	git = {
      enable = true;
      userName = "nik0mi";
      userEmail = "dertonov@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    fish = {
      enable = true;
      interactiveShellInit = ''set fish_greeting'';
      shellAliases = {
        "nixbuild" = "sudo nixos-rebuild switch --flake ~/.mine/.";
      };
    };
  };  

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
    ];
  };

  programs.home-manager.enable = true;
}
