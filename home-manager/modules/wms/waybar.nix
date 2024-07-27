{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "4 4 4 4";

        # modules-left = ["hyprland/workspaces" "hyprland/language" "keyboard-state" "hyprland/submap"];
        # Not sure what "hyprland/submap" is. Documentation is sparse. Removing it for now.
        modules-left = ["hyprland/workspaces" "keyboard-state"];
        # modules-center = ["clock" "custom/weather"];
        # modules-center = ["sway/window"];
        modules-right = ["pulseaudio" "custom/mem" "cpu" "backlight" "battery" "tray" "clock" "custom/poweroff"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

        # "sway/window" = {
        #     max-length = 80;
        #     tooltip = false;
        # };
    
        "custom/poweroff" = {
            tooltip = false;
            format = "";
            on-click = "bash ~/.config/waybar/scripts/poweroff.sh";
        };
     
        # "bluetooth" = {
        #     # controller = "controller1"; # specify the alias of the controller if there are more than 1 on the system
        #     # format = "󰂯 {status}";
        #     # format-* handles every state, so default format is not necessary.
        #     format-on = "󰂯";
        #     format-off = "󰂲";
        #     format-disabled = ""; # an empty format will hide the module;
        #     format-connected = "󰂱 {num_connections}";
        #     # tooltip-format = "{controller_alias}\t{controller_address}";
        #     # tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        #     tooltip-format-connected = "{device_enumerate}";
        #     tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        # };

        "hyprland/language" = {
            format-en = "US";
            min-length = 5;
            tooltip = false;
        };

        "keyboard-state" = {
            #numlock = true;
            capslock = true;
            format = "{icon} ";
            format-icons = {
                locked = " ";
                unlocked = "";
            };
        };

        "clock" = {
            # timezone = "America/New_York";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%a; %d %b, %I:%M %p}";
        };

        # "custom/weather" = {
        #     format = "{}";
        #     tooltip = true;
        #     interval = 1800;
        #     exec = "$HOME/.config/waybar/scripts/wttr.py";
        #     return-type = "json";
        # };

        "pulseaudio" = {
            # scroll-step = 1; # %, can be a float
            reverse-scrolling = 0;
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click = "pavucontrol";
            min-length = 13;
        };

        "custom/mem" = {
            format = "{} ";
            interval = 3;
            exec = "free -h | awk '/Mem:/{printf $3}'";
            tooltip = false;
        };

        "cpu" = {
        interval = 2;
        format = "{usage}% ";
        min-length = 6;
        };

        "temperature" = {
            # thermal-zone = 2;
            # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
            critical-threshold = 80;
            # format-critical = "{temperatureC}°C {icon}";
            format = "{temperatureC}°C {icon}";
            format-icons = ["" "" "" "" ""];
            tooltip = false;
        };

        "backlight" = {
            device = "intel_backlight";
            format = "{percent}% {icon}";
            format-icons = [""];
            min-length = 7;
        };

        # This battery format has such weird icons for some reason...
        # battery = {
        #     states = {
        #         warning = 30;
        #         critical = 15;
        #     };
        #     format = "{capacity}% {icon}";
        #     format-charging = "{capacity}% ";
        #     format-plugged = "{capacity}% ";
        #     format-alt = "{time} {icon}";
        #     format-icons = ["" "" "" "" "" "" "" "" "" ""];
        # on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        # };

        battery = {
            states = {
                good = 95;
                warning = 30;
                critical = 15;
            };
            format = "{capacity}% {icon}";
            # format-charging = "{capacity}% ";
            # format-plugged = "{capacity}% ";
            # format-good: ""; # An empty format will hide the module
            # format-full: "";
            # format-icons = ["" "" "" "" ""];
            format-icons = ["" "" "" "" ""];
            on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        };
        tray = {
            icon-size = 16;
            spacing = 4;
        };

      };
    };

    style = builtins.readFile ./scripts/waybar_config.css;

  };
}
