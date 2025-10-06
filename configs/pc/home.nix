{ ... } :

{
  imports =[
    ../../modules/home-modules.nix
        
    ../../modules/home_manager/pc/mako/mako.nix
    ../../modules/home_manager/pc/niri/niri.nix
    ../../modules/home_manager/pc/fuzzel/fuzzel.nix
    ../../modules/home_manager/pc/waybar/waybar.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";
  
  home.sessionVariables = {
    EDITOR = "hx";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.home-manager.enable = true;
}
