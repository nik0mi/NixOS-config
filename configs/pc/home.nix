{ ... } :

{
  imports =[
    ../../modules/home-modules.nix
        
    ../../modules/home-manager/pc/mako/mako.nix
    ../../modules/home-manager/pc/niri/niri.nix
    ../../modules/home-manager/pc/fuzzel/fuzzel.nix
    ../../modules/home-manager/pc/waybar/waybar.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";
  
  home.sessionVariables = {
    EDITOR = "hx";
    DISPLAY = ":0";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.home-manager.enable = true;
}
