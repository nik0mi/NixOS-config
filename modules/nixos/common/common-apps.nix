{
  pkgs,
  inputs,
  ...
}:
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
    hyprpicker # color picker
    gparted # disks
    better-control # wifi / bluetooth / audio / display
    rmpc # music
    satty # screenshot

    #Utils
    mako
    swww
    nushell
    glib
    mpd
    mediainfo
    nwg-look
    slurp
    grim

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
