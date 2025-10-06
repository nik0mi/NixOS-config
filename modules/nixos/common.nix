{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.amnezia-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    #Apps
    git
    lazygit
    tmux
    amnezia-vpn
    telegram-desktop
    inputs.zen-browser.packages.${pkgs.system}.default

    yazi # file manager
    mpv # video/audio
    qimgv # images
    xarchiver # archives forntend
    p7zip # archives backend
    termusic # music
    zathura # pdf

    #Utils
    mako
    swww
    nwg-look
    hyprpolkitagent

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
    auto-cpufreq
  ];
}
