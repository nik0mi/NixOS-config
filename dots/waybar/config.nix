{ ... } :

{
  programs.waybar.settings.main = {
    "layer" = "top";
    "position" = "top";
    "spacing" = 1;
    "height" = 30;
    "margin-left" = 10;
    "margin-right" = 10;
    
    "modules-center" = [
        "clock"
    ];
    "modules-left" = [
      "network"
      "bluetooth"
      "wireplumber"
      "backlight"
    ];
    "modules-right" = [
      "tray"
      "niri/language"
      "battery"
      "custom/suspend"
      "custom/restart"
      "custom/power"
    ];

    "backlight" = {
        "device" = "intel_backlight";
        "format" = "{icon}   {percent}";
        "format-icons" = ["󰃞" "󰃟" "󰃠"];
        "scroll-step" = 5;
        "tooltip" = false;
    };
    "battery" = {
        "interval" = 1;
        "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 20;};
        "tooltip" = false;
        "format" = "{icon} {capacity}%";
        "format-charging" = "󰂄 {capacity}%";
        "format-plugged" = "󰂄 {capacity}%";
        "format-alt" = "{time} {icon}";
        "format-icons" = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };
    "bluetooth" = {
        "format" = "{status}";
        "format-connected" = "{device_alias}";
        "format-connected-battery" = "{device_alias} {device_battery_percentage}%";
        "on-click" = "sh -c 'bluetoothctl power $(bluetoothctl show | awk \"/Powered/ {print \\$2==\\\"yes\\\"?\\\"off\\\":\\\"on\\\"}\") && pkill -RTMIN+8 waybar'";
        "on-click-right" = "bzmenu --launcher fuzzel";
        "tooltip-format-connected" = "{device_enumerate}";
        "tooltip-format-enumerate-connected" = "{device_alias}";
        "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
        "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_battery_percentage}%";
    };
    "clock" = {
        "interval" = 60;
        "format" = "{:%d.%m.%Y | %H:%M}";
        "tooltip-format" = "<tt>{calendar}</tt>";
        "calendar" = {
            "mode"  = "month";
            "format" = {
              "month" =     "<span color='#7a8570'><b>{}</b></span>";
              "days" =      "<span color='#eff6ee'><b>{}</b></span>";
              "weekdays" =  "<span color='#7a8570'><b>{}</b></span>";
              "today" =     "<span color='#7a8570'><b>{}</b></span>";
            };
        };
    };
    "custom/power" = {
      "format" = "󰧞";
      "on-click" = "shutdown -h now";
      "tooltip" = false;
    };
    "custom/restart" = {
      "format" = "󰧞";
      "on-click" = "reboot";
      "tooltip" = false;
    };
    "custom/suspend" = {
      "format" = "󰧞";
      "on-click" = "systemctl suspend";
      "tooltip" = false;
    };
    "network" = {
      "interval" = 2;
      "format-ethernet" = "󰈁";
      "format-wifi" = " ";
      "on-click-right" = "iwmenu --launcher fuzzel";
      "format-disconnected" = " 󱎘 ";
      "tooltip-format-disconnected" = "Disconnected";
      "tooltip-format" = "Network = {essid}\nSignal strength = {signalStrength}%\nInterface = <b>{ifname}</b>\nIP = <b>{ipaddr}/{cidr}</b>\nGateway = <b>{gwaddr}</b>\nNetmask = <b>{netmask}</b>";
    };
    "niri/language" = {
      "format" = "{short}";
    };
    "tray" = {
      "icon-size" = 16;
      "show-passive-items" = true;
      "spacing" = 10;
      "reverse-direction" = true;
    };
    "wireplumber" = {
        "format" = "{icon}   {volume}";
        "format-muted" = "  Muted";
        "format-icons" = { 
            "headset" = "";
            "headphone" = "";
            "default" = ["" "" "" ""];
        };
        "justify" = "center";
        "tooltip-format" = "{icon} {volume}%";
        "scroll-step" = 5;
        "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "tooltip" = false;
    };
  };
}
