{ config, inputs, pkgs, ... } :

{
  imports = [ inputs.niri.homeModules.niri ];
  
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  
  programs.niri.package = pkgs.niri-stable;
#   home.file = {
#     "/.config/niri" = {
#       source = ../niri;
#       recursive = true;
#     };
#   };

  programs.niri = {
    enable = true;

    settings = {

      input = {
          keyboard = {
              xkb = {
                  layout = "us,ru";
                  options = "grp:alt_shift_toggle";
              };
              "numlock" = true;
          };
          mouse.accel-speed = -0.5;
          touchpad."tap" = true;
    
          warp-mouse-to-focus.enable = true;
          workspace-auto-back-and-forth = true;
      };

      layout = {
        gaps = 10;
        center-focused-column = "never";
        preset-column-widths = [
         { proportion =  0.25;}
         { proportion =  0.5;}
         { proportion =  0.75;}
         { proportion =  1.0;}
        ];
        preset-window-heights = [
         { proportion =  0.25;}
         { proportion =  0.5;}
         { proportion =  0.75;}
         { proportion =  1.0;}
        ];
        default-column-width = { proportion = 0.5; };
        focus-ring.enable = false;
        border = {
          width = 1.5;
          active = "#${config.lib.stylix.colors.base04}";
          inactive = "#${config.lib.stylix.colors.base06}";
          urgent = "#${config.lib.stylix.colors.base02}";
        };

        tab-indicator = {
          corner-radius = 8;
        };
      };

      # window-rules.*cc.matches = [
        # {
          # geometry-corner-radius = 8;
          # clip-to-geometry = true;
        # }
      # ];
      
      # Animations
      animations = {
        workspace-switch.kind = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 1000;
            epsilon = 0.0001;
          };
        };
        window-open.kind = {
          easing = {
            duration-ms = 150;
            curve = "ease-out-expo";
          };
        };
        window-close.kind = {
          easing = {
            duration-ms = 150;
            curve = "ease-out-quad";
          };
        };
        horizontal-view-movement.kind = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        window-movement.kind = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        window-resize.kind = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        config-notification-open-close.kind = {
          spring = {
            damping-ratio = 0.6;
            stiffness = 1000;
            epsilon = 0.001;
          };
        };
        screenshot-ui-open.kind = {
          easing = {
            duration-ms = 200;
            curve = "ease-out-quad";
          };
        };
        overview-open-close.kind = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
      };
      
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
      gestures.hot-corners.enable = true;
      
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      spawn-at-startup = [
        {command = ["waybar"];}
        {command = ["swww-daemon"];}
        {command = ["swww img ~/.mine/dots/wallpapers/1.png"];}
        {command = ["systemctl --user start hyprpolkitagent"];}
      ];

      binds = with config.lib.niri.actions; { 
        "Mod+T".action = spawn "bash" "-c" "notify-send hello && exec kitty";
        "Alt+E".action = spawn "thunar";
        "Alt+T".action = spawn "kitty";
        "Alt+Space".action = spawn "fuzzel" { repeat = false; };
        "Alt+B".action = spawn "zen";
        
        "Mod+O".action = toggle-overview { repeat = false; };
        
        "Mod+Q".action = close-window;
        "Mod+Shift+Q".action = quit;
        
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;
        
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+J".action = move-window-down;
        "Mod+Shift+K".action = move-window-up;
        "Mod+Shift+L".action = move-column-right;
        
        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;
        
        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;
        
        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;
        
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+Ctrl+F".action = expand-column-to-available-width;
        
        "Mod+C".action = center-column;
        "Mod+Ctrl+C".action = center-visible-columns;
        
        "Mod+Ctrl+H".action = set-column-width "-10%";
        "Mod+Ctrl+L".action = set-column-width "+10%";
        "Mod+Ctrl+K".action = set-window-height "-10%";
        "Mod+Ctrl+J".action = set-window-height "+10%";
        
        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
        
        "Shift+Mod+S".action = screenshot;
        "Ctrl+Mod+S".action = screenshot-window;
        
        "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit { allow-inhibiting = false; };
        
        "Mod+Shift+P".action = power-off-monitors;
        
        "XF86MonBrightnessUp".action = spawn "brightnessctl" "set" "5%+";
        "XF86MonBrightnessDown".action = spawn "brightnessctl" "set" "5%-";

        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      };
    };
  };
}
