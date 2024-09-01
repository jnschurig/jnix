{
  imports = [
    ./hyprbind.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = ["--all"];

    settings = {
      # Use: `hyprctl monitors all` to get information about monitors.
      # monitor = "name,resolution@frequency,position,scale"
      monitor = [
        "eDP-2,2560x1600@165,auto,1.25" # Built-in screen
        "DP-3,2560x1440@144,auto,1.25" # My normal second monitor
        "DP-5,2560x1440@144,auto,1.25" # My normal second monitor
        "DP-8,2560x1440@144,auto,1.25" # My normal second monitor
        ",preferred,auto,1" # A catch-all monitor setting.
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,20"
        "QT_QPA_PLATFORM,wayland"
        # "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      # Optionally enable/disable debugging.
      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        # kb_layout = "us,jp";
        # kb_variant = "lang";
        kb_options = [
          # "grp:caps_toggle"
          "caps:hyper"
          # "caps:escape"
        ];

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 8;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        # no_cursor_warps = false; # option DNE
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = false;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        active_opacity = "1.0";    # Fully opaque active windows
        inactive_opacity = "0.75";  # Slightly transparent inactive windows
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        # this one was already commented out to begin with.
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      windowrule = [
        "float, ^(imv)$"
        "float, ^(mpv)$"

        "opacity 0.8 override 0.6 override,kitty"
        "opacity 1.0 override 1.0 override,firefox"
        "opacity 1.0 override 1.0 override,vivaldi"
      ];

      exec-once = [
        # If these don't work, try adding & to the end of each line.
        "nm-applet --indicator"
        "waybar"
        "mako"
        "[workspace special silent; size 75% 20%;move 12.5% 40] kitty" # Have the drop down start up with kitty.
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "blueman-applet"
        # "wl-paste --type text --watch cliphist store"
        # "wl-paste --type image --watch cliphist store"
      ];

      # For bind = [] and others, see ./hyprbind.nix

    };
  };
}
