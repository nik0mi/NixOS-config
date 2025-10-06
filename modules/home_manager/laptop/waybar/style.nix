{ ... }:

{
  programs.waybar.style = ''
    * {
        font-family: JetBrainsMono Nerd Font;
        font-weight: normal;
        font-size: 17px;
        min-height: 0;
        border: none;
        border-radius: 0;
      }

    window#waybar {
        background: @base01;
        color: #2d3228;
        border-right: 0.1rem solid @base02;
        border-bottom: 0.1rem solid @base02;
        border-left: 0.1rem solid @base02;
      }

    #network,
    #bluetooth,
    #custom-power{
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
    #clock,
    #tray,
    #language,
    #battery,
    #network,
    #bluetooth,
    #wireplumber,
    #backlight{
      padding: 0 5 0 5;
      margin: 5 10 5 10;
      border-left: 1px solid @base05;
      border-top: 1px solid @base05;
      border-right: 1px solid @base02;
      border-bottom: 1px solid @base02;
      box-shadow: 1px 1px 1px 0px #2d3228;
      color: @base07
    }

    #custom-power:hover,
    #custom-restart:hover,
    #custom-suspend:hover,
    #tray:hover,
    #battery:hover,
    #network:hover,
    #bluetooth:hover,
    #wireplumber:hover,
    #backlight:hover{
      color: @base07;
      background-position: left;
      background-repeat: no-repeat;
      background-size: contain;
      box-shadow: 0px 0px 0px;
      text-shadow: none;
      background: @base0A;
    }

    #custom-power{
      margin: 5 10 5 2;
    }
    #custom-restart{
      margin: 5 2 5 2;
    }
    #custom-suspend{
      margin: 5 2 5 5;
    }

    #clock {
      padding: 0 10 0 10;
      background-color: @base00;
      border-left: 0.5px solid @base02;
      border-top: 1px solid @base02;
      border-right: 1px solid @base05;
      border-bottom: 1px solid @base05;
      box-shadow: -1px -0.5px 0px 0px #2d3228;
      background-position: right;
      background-size: 13%;
      background-repeat: no-repeat;
      background-origin: content-box;
    }
  '';
}
