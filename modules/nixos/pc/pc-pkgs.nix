{ pkgs, ... }:

{
 services.logmein-hamachi.enable = true;
 nixpkgs.config.allowUnfree = true;
 users.users.ovce.packages = with pkgs; [
    libreoffice
    nftables
    haguichi
    logmein-hamachi
    pinta
    python3
    rmpc
    ungoogled-chromium
    vesktop
  ];
}
