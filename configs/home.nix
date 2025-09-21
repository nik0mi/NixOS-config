{ ... } :

{
  imports =[
    ../dots/vscode/vscode.nix
    ../dots/mako/mako.nix
    ../dots/btop/btop.nix
    ../dots/fish/fish.nix

    ../dots/niri/niri.nix
    ../dots/fish/fish.nix
    ../dots/fuzzel/fuzzel.nix
    ../dots/waybar/waybar.nix

    ../modules/home-manager/git/git.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";
  
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.home-manager.enable = true;
}
