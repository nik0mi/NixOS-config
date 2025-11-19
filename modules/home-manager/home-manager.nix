{ ... }:

{
  imports = [
    ./mpd/mpd.nix
    ./udiskie/udiskie.nix
    ./zellij/zellij.nix
    ./helix/helix.nix
    ./btop/btop.nix
    ./fish/fish.nix
    ./yazi/yazi.nix
    ./git/git.nix
    ./flameshot/flameshot.nix
    ./satty/satty.nix
    ./fuzzel/fuzzel.nix
    ./niri/niri.nix
    ./mako/mako.nix
  ];

  services.hyprpolkitagent.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";
  
  home.sessionVariables = {
    DISPLAY = ":0";
    EDITOR = "zhx";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "xcb";
  };

  programs.home-manager.enable = true;
}
