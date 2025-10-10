{ config, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/$HOME/Music/";
    extraConfig = ''
      type "pipewire"
      name "My PipeWire Output"
    '';

    network.listenAddress = "any"; 
    startWhenNeeded = true; 
  };

  
  services.mpd.user = "ovce";
  systemd.services.mpd.environment = {
      XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.ovce.uid}"; 
  };
}
