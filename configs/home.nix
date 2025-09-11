{ config, pkgs, inputs, lib, ... }:

{
  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
  
  home.file= {
    "/.config/kitty" = {
      source = ../dots/kitty;
      recursive = true;
    };
    "/.themes/Nashville96-Steam" = {
      source = ../dots/themes/retro/theme;
      recursive = true;
    };
    "/.icons/Chicago95-tux" = {
      source = ../dots/themes/retro/icons-cursor;
      recursive = true;
    };
  };

  home.sessionVariables = {
    DISPLAY = ":0";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
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

#  gtk = {
#    enable = true;
#    theme = {
#      name = lib.mkForce "Nashville96-Steam";
#    };
#    iconTheme = {
#      name = lib.mkForce "Chicago95-tux";
#    };
#  };

  programs.home-manager.enable = true;
}
