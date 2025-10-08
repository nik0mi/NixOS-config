{ ... } :

{
  imports =[
    ../../modules/home-manager/pc/home-manager-modules-pc.nix
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
