{ config, pkgs, inputs, lib, ... } :

{
  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
  
  home.file = {
    "/.config/kitty" = {
      source = ../dots/kitty;
      recursive = true;
    };

    "/.config/waybar" = {
      source = ../dots/waybar;
      recursive = true;
    };

    "/.config/niri" = {
      source = ../dots/niri;
      recursive = true;
    };

    "/.config/fuzzel" = {
      source = ../dots/fuzzel;
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

    btop = {
      enable = true;
      settings = {
        color_theme = "stylix";
      };
    };
  };  
  
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-center";
      width = 200;
      text-alignment = "center";
      border-color= lib.mkForce "${config.lib.stylix.colors.base07}";
    };
  };

  stylix.targets.mako.enable = true;
  stylix.targets.fuzzel.enable = true;

  programs.home-manager.enable = true;
}
