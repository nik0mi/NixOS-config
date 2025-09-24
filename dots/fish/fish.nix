{ ... } :

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''set fish_greeting'';
    functions = {
      nixbuild = { 
        body = ''
          cd ~/.mine/
          git add .
          git commit -m "Update system configuration"
          sudo nixos-rebuild switch --flake ~/.mine/.'';
      };
      server = {
        body = ''
          if test (count $argv) -lt 2
            echo "Usage: server <start|stop|restart|status> [server_name]"
            return 1
          end

          set subcommand $argv[1]
          set server_name $argv[2]

          switch $subcommand
            case start
              if test -z "$server_name"
                echo "Specify a server name"
                return 1
              end
              set service_name "minecraft-server-$server_name"
              
              if systemctl is-active --quiet "$service_name"
                echo "Service $service_name is already running"
              else
                echo "Starting $service_name"
                systemctl start "$service_name"
                # Wait a moment for the service to fully start
                sleep 2
              end
              # Attach to tmux session
              sudo tmux -S "/run/minecraft/$server_name.sock" attach

            case stop
              if test -z "$server_name"
                echo "Specify a server name"
                return 1
              end
              set service_name "minecraft-server-$server_name"
              
              if systemctl is-active --quiet "$service_name"
                echo "Stopping $service_name"
                systemctl stop "$service_name"
              else
                echo "Service $service_name is not running"
              end

            case restart
              if test -z "$server_name"
                echo "Specify a server name"
                return 1
              end
              set service_name "minecraft-server-$server_name"
              echo "Restarting $service_name"
              systemctl restart "$service_name"

            case status
              if test -z "$server_name"
                echo "Specify a server name"
                return 1
              end
              set service_name "minecraft-server-$server_name"
              systemctl status "$service_name"

            case '*'
              echo "Unknown subcommand: $subcommand"
              echo "Usage: minecraft <start|stop|restart|status> [server_name]"
              return 1
          end'';
      };
    };
  }; 
}
