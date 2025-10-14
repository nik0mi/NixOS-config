{ pkgs, ... }:

{
  services.logmein-hamachi.enable = true;
  nixpkgs.config.allowUnfree = true;
  users.users.ovce.packages = with pkgs; [
    #UTILS
    python3
    nftables

    #APPS
    pinta
    usbimager
    libreoffice
    ungoogled-chromium

    haguichi
    logmein-hamachi

    #GAMING
    vesktop
    osu-lazer-bin
  ];
}
