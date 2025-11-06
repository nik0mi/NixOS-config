{ pkgs, ... }:

{
  services.logmein-hamachi.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    #UTILS
    python3
    nftables

    #APPS
    godot-mono
    gimp
    usbimager
    libreoffice
    ungoogled-chromium

    haguichi
    logmein-hamachi

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
