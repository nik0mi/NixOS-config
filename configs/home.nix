{ config, pkgs, inputs, lib, ... }:

{
  home.username = "ovce";
  home.homeDirectory = "/home/ovce";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
  
  home.file= {
    #"/.config/hypr" = {
    #  source = ../dots/hypr;
    #  recursive = true;
    #};

    "/.config/quickshell" = {
      source = ../dots/quickshell;
      recursive = true;
    };
  };

  home.sessionVariables = {
    DISPLAY = ":0";
    NIXOS_OZONE_WL = "1";

    #Something from this is fixing vscode
    XDG_CURRENT_DESKTOP = "niri";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
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
  };  

  wayland.windowManager.hyprland = {
    enable = false;
    xwayland.enable = false;

    plugins = [ pkgs.hyprlandPlugins.hyprscrolling ];

    settings = {
      exec-once = ''quickshell & hyprpaper &systemctl --user start hyprpolkitagent'';
      
      general = {
        gaps_in = "5";
        gaps_out = "10";

        border_size = "2";

        "col.active_border" = lib.mkForce "rgb(d8d8d8)";
        "col.inactive_border" = lib.mkForce "rgb(9b9b9b)";

        resize_on_border = "true";

        allow_tearing = "false";

        layout = "scrolling";
      };

      decoration = {
          rounding = "0";
          rounding_power = "2";
          active_opacity = "1.0";
          inactive_opacity = "1.0";
          
          "blur:enabled" = "false";
          
          shadow = {
              enabled = "true";
              range = "2";
              render_power = "5";
              sharp = "false";
              color = lib.mkForce "rgba(00000085)";
              ignore_window = "true";
              offset = "2 2";
              scale = "1";
          };
      };

      "animations:enabled" = "false";
      "misc:force_default_wallpaper" = "0";
      "misc:disable_hyprland_logo" = "true";

      "$menu" = "quickshell ipc call appLauncher_$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name') toggleAppLauncher";
      "$browser" = "firefox";
      "$terminal" = "kitty";
      "$fileManager" = "nemo";

      "$mainMod" = "SUPER";
      
      bind = [
        "ALT, F, exec, $browser"
        "ALT, SPACE, exec, $menu"
        "ALT, T, exec, $terminal"
        "ALT, E, exec, $fileManager"
        "ALT, M, exec, ~/.config/hypr/scripts/mpv.sh"

        "$mainMod SHIFT, S, exec, hyprshot -m region --clipboard-only"
        "SHIFT, PRINT, exec, hyprshot -m output --clipboard-only"
        ", PRINT, exec, hyprshot -m window --clipboard-only"
        
        "$mainMod, Q, killactive,"
        "SHIFT $mainMod, Q, exec, hyprctl kill,"
        
        "$mainMod, F, fullscreen, 0"
        "$mainMod, V, togglefloating,"
        
        "$mainMod, Semicolon, movefocus, r"
        "$mainMod, J, movefocus, l"
        "$mainMod, L, movefocus, u"
        "$mainMod, K, movefocus, d"
        
        "$mainMod SHIFT, Semicolon, movewindow, r"
        "$mainMod SHIFT, J, movewindow, l"
        "$mainMod SHIFT, L, movewindow, u"
        "$mainMod SHIFT, K, movewindow, d"
        
        "$mainMod CTRL, Semicolon, resizeactive, 20 0"
        "$mainMod CTRL, J, resizeactive, -20 0"
        "$mainMod CTRL, K, resizeactive, 0 -20"
        "$mainMod CTRL, L, resizeactive, 0 20"
        
        "$mainMod, RIGHT, workspace, +1"
        "$mainMod, LEFT, workspace, -1"
        "$mainMod SHIFT, RIGHT, movetoworkspace, +1"
        "$mainMod SHIFT, LEFT, movetoworkspace, -1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle "
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
    };
  };

  programs.home-manager.enable = true;
}
