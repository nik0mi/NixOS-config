{ ... } :

{
  imports =[
    ../../modules/home-modules.nix
        
    ../../modules/home-manager/laptop/mako/mako.nix
    ../../modules/home-manager/laptop/niri/niri.nix
    ../../modules/home-manager/laptop/fuzzel/fuzzel.nix
    ../../modules/home-manager/laptop/waybar/waybar.nix
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
