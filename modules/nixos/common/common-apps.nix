{ pkgs, inputs, ... }:
{
  # PROGRAMS
  programs.fish.enable = true;
  programs.amnezia-vpn.enable = true;

  # SERVICES
  services.gvfs.enable = true;
  services.mpd = {
    enable = true;
    musicDirectory = "/$HOME/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };

  # PROGRAMS APPS
  environment.systemPackages = with pkgs; [
    #Apps
    git
    lazygit
    tmux
    amnezia-vpn
    telegram-desktop
    inputs.zen-browser.packages.${pkgs.system}.default

    ymuse
    yazi # file manager
    mpv # video/audio
    qimgv # images
    termusic # music
    rmpc # music
    zathura # pdf
    ouch # archives
    blueberry # bluetooth
    linssid # wifi
    gparted # disk manager
    pavucontrol # audio
    hyprpicker # color picker

    #Utils
    mako
    swww
    nushell
    glib
    mediainfo
    nwg-look

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
