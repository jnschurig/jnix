let
  ## Standard Mod Keys ##
  main_mod = "SUPER";
  hyper_mod = "Ctrl&Shift&Alt&Super"; # Only for use with "binds" ie keysym bindings

  ## Special Workspaces ##
  terminal_workspace_key = "Return";
  terminal_workspace_cmd = "togglespecialworkspace";

  ## Rofi ##
  rofi_cmd = "pkill rofi || rofi -show drun -show-icons";
  rofikey = "space";
  # rofidesc = "MODS,key,description,dispatcher,params";

  ## Media ##
  audio_mute_key = "XF86AudioMute";
  audio_up_key = "XF86AudioRaiseVolume";
  audio_down_key = "XF86AudioLowerVolume";
  
  speaker_mod = "";
  speaker_mute_toggle_command = "pamixer -t";
  speaker_up_cmd = "pamixer -i 5";
  speaker_down_cmd = "pamixer -d 5";

  # Mic commands are the same as speaker, just with Shift as the mod.
  mic_mod = "Shift";
  mic_mute_toggle_command = "pamixer --default-source -t";
  mic_up_cmd = "pamixer --default-source -i 5";
  mic_down_cmd = "pamixer --default-source -d 5";

  audio_control_mod = "";
  audio_preious_key = "XF86AudioPrev";
  audio_preious_cmd = "playerctl previous";
  audio_play_pause_key = "XF86AudioPlay";
  audio_play_pause_cmd = "playerctl play-pause";
  audio_next_key = "XF86AudioNext";
  audio_next_cmd = "playerctl next";

  ## Brightness ##
  brightness_down_key = "XF86MonBrightnessDown";
  brightness_up_key = "XF86MonBrightnessUp";

  monitor_brightness_mod = "";
  monitor_brightness_up_cmd = "brightnessctl set +5%";
  monitor_brightness_down_cmd = "brightnessctl set 5%-";

  keyboard_brightness_mod = "Shift";
  keyboard_brightness_down_cmd = "brightnessctl -d *::kbd_backlight set +33%";
  keyboard_brightness_up_cmd = "brightnessctl -d *::kbd_backlight set 33%-";
in
{
  wayland.windowManager.hyprland.settings = { # KEYBOARD HOTKEY BINDINGS: This will merge with the other settings values in hyprland.nix.
    # Check out the flags section https://wiki.hyprland.org/Configuring/Binds/

    # l -> locked, will also work when an input inhibitor (e.g. a lockscreen) is active.
    # r -> release, will trigger on release of a key.
    # e -> repeat, will repeat when held.
    # n -> non-consuming, key/mouse events will be passed to the active window in addition to triggering the dispatcher.
    # m -> mouse, see below.
    # t -> transparent, cannot be shadowed by other binds.
    # i -> ignore mods, will ignore modifiers.
    # s -> separate, will arbitrarily combine keys between each mod/key, see [Keysym combos](#keysym-combos) above.
    # d -> has description, will allow you to write a description for your bind.
        
    bindle = [ # Repeat while held, works on lock screen
      ## Volume and Media Control ##
      # Speakers
      "${speaker_mod}, ${audio_up_key}, exec, ${speaker_up_cmd}"
      "${speaker_mod}, ${audio_down_key}, exec, ${speaker_down_cmd}"
      # Mic
      "${mic_mod}, ${audio_up_key}, exec, ${mic_up_cmd}"
      "${mic_mod}, ${audio_down_key}, exec, ${mic_down_cmd}"
    ];

    bindl = [ # locked: works while system locked.
      # Speakers
      "${speaker_mod}, ${audio_mute_key}, exec, ${speaker_mute_toggle_command}"

      # Mic
      "${mic_mod}, ${audio_mute_key}, exec, ${mic_mute_toggle_command}"

      "${audio_control_mod}, ${audio_preious_key}, exec, ${audio_preious_cmd}"
      "${audio_control_mod}, ${audio_play_pause_key}, exec, ${audio_play_pause_cmd}"
      "${audio_control_mod}, ${audio_next_key}, exec, ${audio_next_cmd}"
    ];

    bindm = [
      "${main_mod}, mouse:272, movewindow"
      "${main_mod}, Control_L, movewindow" # Touchpad dragging stinks

      "${main_mod}, mouse:273, resizewindow"
      "${main_mod}, ALT_L, resizewindow" # Touchpad dragging stinks
    ];

    binds = [ # Keysym combos. Arbitrary keys by reference.
      # A duplicate of the regular combo, but with hyper instead.
      # For some reason hyper key also gets recognized as regular super, and doesn't work on its own.
      "${hyper_mod}, ${terminal_workspace_key}, ${terminal_workspace_cmd}"
    ];

    bind = [
      # Rofi application launcher
      # Kind of wanted two versions of this because I always get them mixed up when going between systems.
      "${main_mod}, ${rofikey}, exec, ${rofi_cmd}"
      "alt, ${rofikey}, exec, ${rofi_cmd}"

      # Poweroff script.
      "${main_mod} Shift, P, exec, ~/.config/waybar/scripts/poweroff.sh"

      # "${main_mod}, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
      "${main_mod}, T, exec, kitty"
      "${main_mod}, Q, killactive,"
      "${main_mod}, E, exec, dolphin"
      "${main_mod}, F, exec, togglefloating" # Not a recommended key
      # "${main_mod}, P, exec, pseudo" # dwindle"
      # "${main_mod}, O, exec, togglesplit" # dwindle"

      # Move focus with mainMod + arrow keys
      "${main_mod}, left,  movefocus, l"
      "${main_mod}, right, movefocus, r"
      "${main_mod}, up,    movefocus, u"
      "${main_mod}, down,  movefocus, d"

      "${main_mod}, J, movefocus, l" # left
      "${main_mod}, K, movefocus, d" # down
      "${main_mod}, L, movefocus, u" # up
      "${main_mod}, semicolon, movefocus, r" # right

      # Moving windows
      "${main_mod} SHIFT, left,  swapwindow, l"
      "${main_mod} SHIFT, right, swapwindow, r"
      "${main_mod} SHIFT, up,    swapwindow, u"
      "${main_mod} SHIFT, down,  swapwindow, d"

      "${main_mod} SHIFT, J, swapwindow, l" # left
      "${main_mod} SHIFT, K, swapwindow, d" # down
      "${main_mod} SHIFT, L, swapwindow, u" # up
      "${main_mod} SHIFT, semicolon, swapwindow, r" # right

      # Window resizing                        X  Y
      "${main_mod} CTRL, left,  resizeactive, -60 0"
      "${main_mod} CTRL, right, resizeactive,  60 0"
      "${main_mod} CTRL, up,    resizeactive,  0 -60"
      "${main_mod} CTRL, down,  resizeactive,  0  60"

      "${main_mod} CTRL, J, resizeactive, -60 0"  # left
      "${main_mod} CTRL, K, resizeactive,  0  60" # down
      "${main_mod} CTRL, L, resizeactive,  0 -60" # up
      "${main_mod} CTRL, semicolon, resizeactive,  60 0"  # right

      # Modify Windows
      # Not yet implemented
      # "${main_mod} f, toggle fullscreen"
      # "${main_mod} v, split a window vertically"
      # "${main_mod} h, split a window horizontally"
      # "${main_mod} r, resize mode"

      # Change Container Layout
      # Not yet implemented
      # "${main_mod}, E, default"
      # "${main_mod}, S, stacking"
      # "${main_mod}, W, tabbed"

      # Floating
      "${main_mod} Shift, Space, togglefloating,"

      # Brightness control
      "${monitor_brightness_mod}, ${brightness_down_key}, exec, ${monitor_brightness_down_cmd}"
      "${monitor_brightness_mod}, ${brightness_up_key}, exec, ${monitor_brightness_up_cmd}"

      # Keyboard backlight
      "${keyboard_brightness_mod}, ${brightness_down_key}, exec, ${keyboard_brightness_down_cmd}"
      "${keyboard_brightness_mod}, ${brightness_up_key}, exec, ${keyboard_brightness_up_cmd}"

      # Waybar
      "${main_mod} Shift, B, exec, pkill -SIGUSR1 waybar"
      "${main_mod} Shift, N, exec, pkill -SIGUSR2 waybar"

      # Disable all effects
      "${main_mod} Shift, G, exec, ~/.config/hypr/scripts/gamemode.sh"

      "${main_mod}, Tab, workspace, previous"
      "Alt, Tab, workspace, previous"

      # Scroll through existing workspaces with mainMod + scroll
      "${main_mod}, mouse_down, workspace, e+1"
      "${main_mod}, mouse_up, workspace, e-1"

      "${main_mod}, comma, workspace, -1"
      "${main_mod}, period, workspace, +1"

      # Toggle Special Terminal workspace
      "${main_mod}, ${terminal_workspace_key}, ${terminal_workspace_cmd}"

      # ", Print, exec, grim -g \"$(slurp -d)\" - | wl-copy"
      ", Print, exec, grim -g \"$(slurp -d)\" -" # Saves to to the screenshot folder `~/Pictures/screenshots/`
    ] ++ (
      # workspaces
      # binds $mainMod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "${main_mod}, ${ws}, workspace, ${toString (x + 1)}"
            "${main_mod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
    );
  };
}