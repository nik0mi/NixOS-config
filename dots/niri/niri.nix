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
    
          "warp-mouse-to-focus" = true;
          "workspace-auto-back-and-forth" = true;
      };

      layout = {
        gaps = 10;
        center_focused_column = "never";
        preset_column_widths = [ 0.25 0.5 0.75 1.0 ];
        preset_window_heights = [ 0.25 0.5 0.75 1.0 ];
        default_column_width = {
          proportion = 0.5;
        };
        focus_ring = "off";
        border = {
          width = 1.5;
          active_color = "#${config.lib.stylix.colors.base04}";
          inactive_color = "#${config.lib.stylix.colors.base06}";
          urgent_color = "#${config.lib.stylix.colors.base02}";
        };
      };

      window-rules = [
        {
          geometry-corner-radius = 8;
          clip-to-geometry = true;
        }
      ];
      
      # Animations
      animations = {
        workspace-switch = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 1000;
            epsilon = 0.0001;
          };
        };
        window-open = {
          duration-ms = 150;
          curve = "ease-out-expo";
        };
        window-close = {
          duration-ms = 150;
          curve = "ease-out-quad";
        };
        horizontal-view-movement = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        window-movement = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        window-resize = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        config-notification-open-close = {
          spring = {
            damping-ratio = 0.6;
            stiffness = 1000;
            epsilon = 0.001;
          };
        };
        screenshot-ui-open = {
          duration-ms = 200;
          curve = "ease-out-quad";
        };
        overview-open-close = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
      };
      
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
      gestures.hot-corners.off = true;
      
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      spawn-at-startup = [
        "waybar"
        "swww-daemon"
        "swww img ~/.mine/dots/wallpapers/1.png"
        "systemctl --user start hyprpolkitagent"
      ];

      binds = {

        "Mod+T" = { spawn = [ "bash" "-c" "notify-send hello && exec kitty" ]; };
        "Alt+E" = { spawn = [ "thunar" ]; };
        "Alt+T" = { spawn = [ "kitty" ]; };
        "Alt+Space" = {
          repeat = false;
          spawn = [ "fuzzel" ];
        };
        "Alt+B" = { spawn = [ "zen" ]; };
        
        "Mod+D" = "focus-workspace 10";
        
        "Mod+O" = {
          repeat = false;
          action = "toggle-overview";
        };
        
        "Mod+Q" = "close-window";
        "Mod+Shift+Q" = "quit";
        
        "Mod+H" = "focus-column-left";
        "Mod+J" = "focus-window-down";
        "Mod+K" = "focus-window-up";
        "Mod+L" = "focus-column-right";
        
        "Mod+Shift+H" = "move-column-left";
        "Mod+Shift+J" = "move-window-down";
        "Mod+Shift+K" = "move-window-up";
        "Mod+Shift+L" = "move-column-right";
        
        "Mod+BracketLeft" = "consume-or-expel-window-left";
        "Mod+BracketRight" = "consume-or-expel-window-right";
        
        "Mod+Comma" = "consume-window-into-column";
        "Mod+Period" = "expel-window-from-column";
        
        "Mod+R" = "switch-preset-column-width";
        "Mod+Shift+R" = "switch-preset-window-height";
        
        "Mod+F" = "maximize-column";
        "Mod+Shift+F" = "fullscreen-window";
        "Mod+Ctrl+F" = "expand-column-to-available-width";
        
        "Mod+C" = "center-column";
        "Mod+Ctrl+C" = "center-visible-columns";
        
        "Mod+Ctrl+H" = "set-column-width -10%";
        "Mod+Ctrl+L" = "set-column-width +10%";
        "Mod+Ctrl+K" = "set-window-height -10%";
        "Mod+Ctrl+J" = "set-window-height +10%";
        
        "Mod+V" = "toggle-window-floating";
        "Mod+Shift+V" = "switch-focus-between-floating-and-tiling";
        
        "Shift+Mod+S" = "screenshot";
        "Alt+Mod+S" = "screenshot-screen";
        "Ctrl+Mod+S" = "screenshot-window";
        
        "Mod+Escape" = {
          allow-inhibiting = false;
          action = "toggle-keyboard-shortcuts-inhibit";
        };
        
        "Mod+Shift+P" = "power-off-monitors";
        
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          spawn = [ "brightnessctl" "set" "5%+" ];
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          spawn = [ "brightnessctl" "set" "5%-" ];
        };
        
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" ];
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
        };
      };
    };
  };
}
