{ pkgs, ... }:

let
  time = pkgs.writeShellScriptBin "time" (builtins.readFile ./scripts/time.sh);
  volumeosd = pkgs.writeShellScriptBin "volumeosd" (builtins.readFile ./scripts/volumeosd.sh);
  powermenu = pkgs.writeShellScriptBin "powermenu" (builtins.readFile ./scripts/powermenu.sh);
in
{
  nixpkgs.config.allowUnfree = true;

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
    zellij
    firefox
    lazygit
    localsend
    amnezia-vpn
    telegram-desktop

    mpv # video/audio
    yazi # file manager
    ouch # archives
    rmpc # music
    satty # screenshot
    piper # mouse
    qimgv # images
    gparted # disks
    zathura # pdf
    blobdrop # drag-and-drop
    hyprpicker # color picker
    better-control # wifi / bluetooth / audio / display

    #Fuzzel
    fuzzel
    time
    volumeosd
    powermenu

    #Notifications
    mako
    libnotify 
    notify-osd 

    #Utils
    mpd
    swww
    glib
    grim
    slurp
    nushell
    nwg-look
    mediainfo

    #WMstuff
    waybar
    wl-clipboard

    #Terminal
    fish
    kitty

    #Terminal-utils
    btop
    fastfetch
  ];
}
