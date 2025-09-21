{ ... }:

{
  services.minecraft-server = {
    enable = false;
    eula = true;
    
    declarative = true;
    dataDir = "/var/lib/mine_server";
    serverProperties = {
      motd = "Sosali?";

      max-players=4;
      gamemode = "survival";
      difficulty = "hard";
      
      simulation-distance = 15;
      
      online-mode = false;
    };
    jvmOpts = "-Xms2048M -Xmx4096M";
  };
#  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
#  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

#  services.minecraft-servers = {
#    enable = true;
#    eula = true;
#    
#    dataDir = "/var/lib/mine_servers/";
#
#    servers.mine_server = {
#        enable = true;
#        package = pkgs.vanillaServers.vanilla-1_21_8;
#
#        serverProperties = {
#        motd = "Sosali?";
#
#        max-players=4;
#        gamemode = "survival";
#        difficulty = "hard";
#        
#        simulation-distance = 15;
#        
#        online-mode = false;
#      };
#
#      jvmOpts = "-Xms4092M -Xmx4092M";
#    };
#  };
}
