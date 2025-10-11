{ ... }:

{
  programs.waybar.style =
  # css
  ''
    * {
      font-family: JetBrainsMono Nerd Font;
      font-weight: bold;
      font-size: 17px;
      min-height: 0;
      border: none;
      border-radius: 0;
    }

    window#waybar {
      background: none;
    }

    #network,
    #bluetooth,
    #custom-power {
      background-position: left;
      background-repeat: no-repeat;
      background-size: contain;
    }

    #battery,
    #backlight,
    #wireplumber {
      background-position: right;
      background-size: 30%;
      background-origin: content-box;
    }

    #custom-power,
    #custom-restart,
    #custom-suspend,
    #mpd,
    #clock,
    #tray,
    #language,
    #battery,
    #network,
    #bluetooth,
    #wireplumber,
    #backlight {
      background-color: @base00;
      padding: 0 10 0 10;
      margin: 5 10 5 10;
      border: 2px solid @base05;
      border-radius: 8;
      color: @base04;
    }

    #mpd {
      background-color: @base00;
      padding: 0 10px; 
      margin: 5px 100px; 
      border: 2px solid @base05;
      border-radius: 8px; 
      color: @base04;
      font-family: JetBrainsMono Nerd Font;
      font-weight: bold;
      font-size: 17px;
    }


    #mpd.disconnected:hover,
    #mpd.paused:hover,
    #mpd.stopped:hover,
    #mpd.disconnected,
    #mpd.paused,
    #mpd.stopped {
      background-color: transparent;
      border-color: transparent;
      color: transparent;
    }

    .modules-left {
      margin: 0 -10 0 -10;
    }

    .modules-right {
      margin: 0 -10 0 -10;
    }

    #custom-power:hover,
    #custom-restart:hover,
    #custom-suspend:hover,
    #mpd:hover,
    #battery:hover,
    #network:hover,
    #bluetooth:hover,
    #wireplumber:hover,
    #backlight:hover {
      color: @base03;
      border-color: @base03;
      background-position: left;
      background-repeat: no-repeat;
      background-size: contain;
      box-shadow: 0px 0px 0px;
      text-shadow: none;
      background: @base05;
    }

    #custom-power {
      margin: 5 10 5 2;
    }

    #custom-restart {
      margin: 5 2 5 2;
    }

    #custom-suspend {
      margin: 5 2 5 5;
    }

    #clock {
      padding: 0 20 0 20;
    }
  '';
}
