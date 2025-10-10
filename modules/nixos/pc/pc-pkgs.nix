{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  users.users.ovce.packages = with pkgs; [
    libreoffice
    nftables
    pinta
    python3
    rmpc
    ungoogled-chromium
    vesktop
  ];
}
