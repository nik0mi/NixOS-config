{ config, pkgs, inputs, lib, ... } :

{
  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
  
  home.file = {
    "/.config/kitty" = {
      source = ../dots/kitty;
      recursive = true;
    };
  };

  home.sessionVariables = {
    DISPLAY = " =0";
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  programs = {
  	git = {
      enable = true;
      userName = "nik0mi";
      userEmail = "dertonov@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    fish = {
      enable = true;
      interactiveShellInit = ''set fish_greeting'';
      shellAliases = {
        "nixbuild" = "sudo nixos-rebuild switch --flake ~/.mine/.";
      };
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "stylix";
      };
    };

    waybar = {
      enable = true;
      settings.main = {
          "layer" = "top";
          "position" = "top";
          "height" = 30;
          "spacing" = 5;
          "margin-top" = 0;
          "margin-right" = 10;
          "margin-left" = 10;

          "modules-left" = ["network" "bluetooth" "wireplumber" "backlight"];
          "modules-center" = ["clock"];
          "modules-right" = ["tray" "battery" "custom/power"];

          "battery" = {
              "interval" = 1;
              "states" = {
                  "good" = 95;
                  "warning" = 30;
                  "critical" = 20;};
              "tooltip" = false;
              "format" = "{icon} {capacity}%";
              "format-charging" = "{capacity}% 󰂄";
              "format-plugged" = "{capacity}% 󰂄";
              "format-alt" = "{time} {icon}";
              "format-icons" = ["󰁻" "󰁼" "󰁾" "󰂀" "󰂂" "󰁹"];
          };

          "wireplumber" = {
              "format" = "{icon} {volume}%";
              "format-muted" = "󰖁";
              "format-icons" =  ["󰕿" "󰖀" "󰕾"];
              "justify" = "center";
              "tooltip-format" = "{icon} {volume}%";
              "scroll-step" =5;
              "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              "tooltip" = false;
          };

          "network" = {
            "format-wifi" = " ";
            "format-ethernet" =" ";
            "format-disconnected" = "";
            "tooltip-format" = "{ipaddr}";
            "tooltip-format-wifi" = "{essid} ({signalStrength}%)  | {ipaddr}";
            "tooltip-format-ethernet" = "{ifname}   | {ipaddr}";
            "on-click-right" = "kitty impala";
          };

          "bluetooth" = {
              "format" = "{status}"; 

              "on-click" = "sh -c 'bluetoothctl power $(bluetoothctl show | awk \"/Powered/ {print \\$2==\\\"yes\\\"?\\\"off\\\" =\\\"on\\\"}\") && pkill -RTMIN+8 waybar'";
              "on-click-right" = "kitty bluetuith";

              "format-connected" = "conn";
              "format-connected-battery" = "{device_battery_percentage}%";

              "tooltip-format-connected" = "{device_enumerate}";
              "tooltip-format-enumerate-connected" = "{device_alias}";
              "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_battery_percentage}%";
          };

          "tray" = {
              "icon-size" = 16;
              "spacing" = 10;
              "show-passive-items" = true;
          };

          "clock" = {
              "format" = "{ =%H =%M}";
              "format-alt" = "{ =%d.%m.%Y | %H =%M}";
              "tooltip" = false;
          };

          "backlight" = {
              "device" = "intel_backlight";
              "format" = "{icon}{percent}%";
              "format-icons" = ["󰃞 " "󰃟 " "󰃠 "];
              "scroll-step" = 5;
              "tooltip" = false;
          };

          "custom/power" = {
              "format"  = "󰧞";
              "tooltip" = false;
              "on-click" = "shutdown -h now";
          };
      };
    };

#    fuzzel = {
#      enable = true;
#      settings = {
#        font = "Nerd Fonts JetBrains Mono =size=24";
#        border.width = 2;
#        border.radius = 0;
#        colors = {
#          border = lib.mkForce "${config.lib.stylix.colors.base05}";
#        };
#        #font.size = 36;
#        #font.weight = "bold";
#      };
#    };
  };  
  services.mako = {
    enable = true;
    settings = {
      anchor = "bottom-center";
      width = 200;
      text-alignment = "center";
    };
  };

  stylix.targets.mako.enable = true;
  stylix.targets.fuzzel.enable = true;

  programs.home-manager.enable = true;
}
