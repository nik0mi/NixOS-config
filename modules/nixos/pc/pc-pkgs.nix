{ pkgs, ... }:

{
  services.logmein-hamachi.enable = true;
  environment.systemPackages = with pkgs; [
    #UTILS
    python3
    nftables

    #APPS
    gimp
    zoom-us
    nemo
    usbimager
    godot-mono
    libreoffice
    ungoogled-chromium

    haguichi
    logmein-hamachi

    bottles-unwrapped
    wineWowPackages.waylandFull
    winetricks
    #GAMING
    wine-wayland
    lutris
    vesktop
    osu-lazer-bin

    #OTHER
    orca-slicer
    gruvbox-plus-icons
  ];
}
