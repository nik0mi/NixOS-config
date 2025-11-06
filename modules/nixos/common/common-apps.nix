{ pkgs, ... }:

let
  volumeosd = pkgs.writeShellScriptBin "volumeosd" (builtins.readFile ./volumeosd.sh);
  powermenu = pkgs.writeShellScriptBin "powermenu" (builtins.readFile ./powermenu.sh);
in
{
  # PROGRAMS
  programs.fish.enable = true;
  programs.amnezia-vpn.enable = true;

  # SERVICES
  services.gvfs.enable = true;
  services.ratbagd.enable = true;
  services.udisks2.enable = true;

  # PROGRAMS APPS
  environment.systemPackages = with pkgs; [
    #Apps
    git
    localsend
    lazygit
    amnezia-vpn
    zellij
    telegram-desktop
    firefox

    libnotify
    notify-osd
    udiskie
    piper # mouse
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
    blobdrop # drag-and-drop

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

    volumeosd
    powermenu
  ];
}
