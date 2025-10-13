{ pkgs, inputs, ... }:
{
  # PROGRAMS
  programs.fish.enable = true;
  programs.amnezia-vpn.enable = true;

  # SERVICES
  services.gvfs.enable = true;

  # PROGRAMS APPS
  environment.systemPackages = with pkgs; [
    #Apps
    git
    lazygit
    amnezia-vpn
    zellij
    telegram-desktop
    inputs.zen-browser.packages.${pkgs.system}.default

    yazi # file manager
    mpv # video/audio
    qimgv # images
    termusic # music
    zathura # pdf
    ouch # archives
    blueberry # bluetooth
    linssid # wifi
    pavucontrol # audio
    hyprpicker # color picker
    gparted # disks

    #Utils
    ripdrag
    mako
    swww
    nushell
    glib
    mpd
    mediainfo
    nwg-look

    #WMstuff
    waybar
    wl-clipboard
    fuzzel

    #Terminal
    fish
    kitty

    #Terminal-utils
    btop
    fastfetch
  ];
}
