{ pkgs, ... }:

let
  time = pkgs.writeShellScriptBin "time" (builtins.readFile ./scripts/time.sh);
  volumeosd = pkgs.writeShellScriptBin "volumeosd" (builtins.readFile ./scripts/volumeosd.sh);
  powermenu = pkgs.writeShellScriptBin "powermenu" (builtins.readFile ./scripts/powermenu.sh);
in
{
  imports = [
    ./stylix/stylix.nix
    ./greetd/greetd.nix
    ./xdg-portals/xdg-portals.nix
    ./grub/grub.nix
    ./steam/steam.nix
    ./nvidia/nvidia.nix 
  ];

  # PROGRAMS
  programs.fish.enable = true;
  programs.amnezia-vpn.enable = true;

  # SERVICES
  services.gvfs.enable = true;
  services.ratbagd.enable = true;
  services.udisks2.enable = true;
  services.logmein-hamachi.enable = true;

  # APPS
  environment.systemPackages = with pkgs; [
    # Gaming
    lutris
    vesktop
    osu-lazer-bin

    # Apps
    git
    zellij
    zoom-us
    firefox
    lazygit
    usbimager
    localsend
    godot-mono
    orca-slicer
    amnezia-vpn
    libreoffice
    telegram-desktop
    ungoogled-chromium

    # Hamachi
    haguichi
    logmein-hamachi

    # Wine
    winetricks
    wine-wayland
    bottles-unwrapped

    mpv # video/audio
    yazi # file manager
    nemo # file manager
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

    # WMstuff
    waybar
    wl-clipboard

    # Terminal
    fish
    kitty

    # Terminal-utils
    btop
    fastfetch

    # Other
    python3
    gruvbox-plus-icons
  ];
}
