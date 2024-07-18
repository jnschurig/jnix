{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";
      # "$mainMod" = "hyper";

      # monitor = ",1920x1080@90,auto,1";
      monitor = "WL-1,2560x1600@165,auto,1";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,20"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      # decoration.active_opacity
      # decoration.inactive_opacity

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        # kb_layout = "us,ru";
        # kb_variant = "lang";
        # kb_options = "grp:caps_toggle";
        kb_options = [
          "caps:hyper"
        ];

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        # no_cursor_warps = false; # option DNE
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        active_opacity = "1.0";    # Fully opaque active windows
        inactive_opacity = "0.8";  # Slightly transparent inactive windows
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
        "swww init"
        "swww img ~/Pictures/wallpaper/background/""JQX6q2g - Imgur.png"""
        "nm-applet --indicator"
        "waybar"
        "mako"
        "[workspace special; size 75% 20%;move 12.5% 40] kitty"
      #   "wl-paste --type text --watch cliphist store"
      #   "wl-paste --type image --watch cliphist store"
      ];

      bind = [

      #   "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        # "$mainMod, S, exec, rofi -show drun -show-icons"
        "$mainMod, space, exec, rofi -show drun -show-icons"
        "alt, space, exec, rofi -show drun -show-icons"
        "$mainMod, T, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, E, exec, dolphin"
        "$mainMod, F, togglefloating,"
      #   "$mainMod, D, exec, wofi --show drun"
      #   "$mainMod, P, pseudo, # dwindle"
      #   "$mainMod, J, togglesplit, # dwindle"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

      #   # Keyboard backlight
      #   "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
      #   "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        ## Volume and Media Control ##
        # Speakers
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        # Mic
        "Shift, XF86AudioMute, exec, pamixer --default-source -t"
        "Shift, XF86AudioRaiseVolume, exec, pamixer --default-source -i 5 "
        "Shift, XF86AudioLowerVolume, exec, pamixer --default-source -d 5 "
        # Media
        # TODO: do this sometime...
        
        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

      #   # Configuration files
      #   ''$mainMod SHIFT, N, exec, kitty -e sh -c "rb"''
      #   ''$mainMod SHIFT, C, exec, kitty -e sh -c "conf"''
      #   ''$mainMod SHIFT, H, exec, kitty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
      #   ''$mainMod SHIFT, W, exec, kitty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix''
      #   '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

      #   # Waybar
      #   "$mainMod, B, exec, pkill -SIGUSR1 waybar"
      #   "$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # Disable all effects
        "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "

        "Alt, Tab, workspace, previous"
        "Shift Alt, Tab, workspace, next"
        
        "$mainMod, Return, togglespecialworkspace"
      ]
      # Fancy script I found
      # Switch workspaces with mainMod + [0-9]
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      ++ (
        # workspaces
        # binds $mainMod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
              "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
