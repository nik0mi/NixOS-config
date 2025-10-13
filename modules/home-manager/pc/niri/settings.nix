{ config, ... }:

{
  programs.niri.settings = {
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
        { proportion = 0.25; }
        { proportion = 0.5; }
        { proportion = 0.75; }
        { proportion = 1.0; }
      ];
      preset-window-heights = [
        { proportion = 0.25; }
        { proportion = 0.5; }
        { proportion = 0.75; }
        { proportion = 1.0; }
      ];
      default-column-width = {
        proportion = 0.5;
      };
      focus-ring.enable = false;
      border = {
        enable = true;
        width = 1.5;
        active.color = "#${config.lib.stylix.colors.base06}";
        inactive.color = "#${config.lib.stylix.colors.base04}";
        urgent.color = "#${config.lib.stylix.colors.base02}";
      };
    };

    window-rules = [
      {
        geometry-corner-radius =
          let
            radius = 8.0;
          in
          {
            bottom-left = radius;
            bottom-right = radius;
            top-left = radius;
            top-right = radius;
          };
        clip-to-geometry = true;
      }
    ];

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
    gestures.hot-corners.enable = false;

    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    spawn-at-startup = [
      { command = [ "waybar" ]; }
      { command = [ "swww-daemon" ]; }
      { command = [ "swww img ~/.mine/wallpapers/1.png" ]; }
      { command = [ "systemctl --user start hyprpolkitagent" ]; }
    ];

    binds =
      with config.lib.niri.actions;
      let
        sh = spawn "kitty" "-e" "fish" "-i" "-c";
      in
      {
        "Alt+E".action = sh "yazi";
        "Alt+M".action = sh "termusic";

        "Alt+T".action = spawn "kitty";
        "Alt+Space".action = spawn "fuzzel";
        "Alt+B".action = spawn "zen";

        "Alt+P".action = spawn "hyprpicker" "-a";

        "Mod+O".action = toggle-overview;

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

        "Mod+Shift+P".action = power-off-monitors;

        "XF86MonBrightnessUp".action = spawn "brightnessctl" "set" "5%+";
        "XF86MonBrightnessDown".action = spawn "brightnessctl" "set" "5%-";

        "XF86AudioPlay".action = spawn "mpc" "toggle";
        "XF86AudioPrev".action = spawn "mpc" "prev";
        "XF86AudioNext".action = spawn "mpc" "next";

        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      };
  };
}
