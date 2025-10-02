{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    
    #To connect to the console, run tmux -S /run/minecraft/mine_server.sock attach, press Ctrl + b then d to detach
    #systemctl start minecraft-server-mine_server
    servers = {
      mine_server = {
        enable = true;
        autoStart = false;
        package = pkgs.vanillaServers.vanilla-1_21_5;

        serverProperties = {
          motd = "§l§dsosalki only";

          allow-cheats = true;
          gamemode = "survival";
          difficulty = "hard";
          
          max-players=4;
          simulation-distance = 15;
          
          online-mode = false;
          server-port = 25656;#change port to 25565 if want start server
        };

        jvmOpts = "-Xms2048M -Xmx4096M";
      };

      second_server = {
        enable = true;
        autoStart = false;
        package = pkgs.vanillaServers.vanilla-1_21_8;

        serverProperties = {
          motd = "§l§dsosalki only";

          allow-cheats = true;
          gamemode = "survival";
          difficulty = "hard";
          
          max-players=2;
          simulation-distance = 15;
          
          online-mode = false;
          server-port = 25565;#change port to 25565 if want start server
        };

        jvmOpts = "-Xms2048M -Xmx4096M";
      };
    };
  };
}
