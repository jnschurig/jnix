let
  ## Standard Mod Keys ##
  main_mod = "SUPER";
  hyper_mod = "Ctrl&Shift&Alt&Super_l";

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

  # Mic commands are the same as speaker, just with Shift.
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
    
    # Key variables
    "$mainMod" = "${main_mod}";
    # "$hyperMod" = "Ctrl+Shift+Alt+Super";
    "$hyperMod" = "${hyper_mod}";
    
    bindr = [ # Release, trigger on release of a key
      # Rofi application launcher
      "$mainMod, ${rofikey}, exec, ${rofi_cmd}"
      "alt, ${rofikey}, exec, ${rofi_cmd}"
    ];

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
      "$mainMod, mouse:272, movewindow"
      "$mainMod, Control_L, movewindow" # Touchpad dragging stinks

      "$mainMod, mouse:273, resizewindow"
      "$mainMod, ALT_L, resizewindow" # Touchpad dragging stinks
    ];

    binds = [ # Keysym combos. Arbitrary keys by reference.
      "$hyperMod, ${terminal_workspace_key}, ${terminal_workspace_cmd}"
    ];

    bind = [

      # "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
      "$mainMod, T, exec, kitty"
      "$mainMod, Q, killactive,"
      "$mainMod, E, exec, dolphin"
      # "$mainMod, F, togglefloating," # Not a recommended key
      # "$mainMod, P, pseudo, # dwindle"
      # "$mainMod, J, togglesplit, # dwindle"

      # Move focus with mainMod + arrow keys
      "$mainMod, left,  movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up,    movefocus, u"
      "$mainMod, down,  movefocus, d"

      "$mainMod, J, movefocus, l" # left
      "$mainMod, K, movefocus, d" # down
      "$mainMod, L, movefocus, r" # up
      "$mainMod, ;, movefocus, u" # right

      # Moving windows
      "$mainMod SHIFT, left,  swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up,    swapwindow, u"
      "$mainMod SHIFT, down,  swapwindow, d"

      "$mainMod SHIFT, J, swapwindow, l" # left
      "$mainMod SHIFT, K, swapwindow, d" # down
      "$mainMod SHIFT, L, swapwindow, u" # up
      "$mainMod SHIFT, ;, swapwindow, r" # right

      # Window resizing                     X  Y
      "$mainMod CTRL, left,  resizeactive, -60 0"
      "$mainMod CTRL, right, resizeactive,  60 0"
      "$mainMod CTRL, up,    resizeactive,  0 -60"
      "$mainMod CTRL, down,  resizeactive,  0  60"

      "$mainMod CTRL, J, resizeactive, -60 0"  # left
      "$mainMod CTRL, K, resizeactive,  0  60" # down
      "$mainMod CTRL, L, resizeactive,  0 -60" # up
      "$mainMod CTRL, ;, resizeactive,  60 0"  # right

      # Modify Windows
      # Not yet implemented
      # "$mainMod f, toggle fullscreen"
      # "$mainMod v, split a window vertically"
      # "$mainMod h, split a window horizontally"
      # "$mainMod r, resize mode"

      # Change Container Layout
      # Not yet implemented
      # "$mainMod e, default"
      # "$mainMod s, stacking"
      # "$mainMod w, tabbed"

      # Floating
      "$mainMod Shift, Space, togglefloating,"

      # Brightness control
      "${monitor_brightness_mod}, ${brightness_down_key}, exec, ${monitor_brightness_down_cmd}"
      "${monitor_brightness_mod}, ${brightness_up_key}, exec, ${monitor_brightness_up_cmd}"

      # Keyboard backlight
      "${keyboard_brightness_mod}, ${brightness_down_key}, exec, ${keyboard_brightness_down_cmd}"
      "${keyboard_brightness_mod}, ${brightness_up_key}, exec, ${keyboard_brightness_up_cmd}"

      # I wish this one would work. I don't know why it doesn't...
      "$mainMod Shift, P, exec, ~/.config/waybar/scripts/poweroff.sh"

      # Waybar
      # "$mainMod, B, exec, pkill -SIGUSR1 waybar"
      # "$mainMod, W, exec, pkill -SIGUSR2 waybar"

      # Disable all effects
      "$mainMod Shift, G, exec, ~/.config/hypr/scripts/gamemode.sh"

      "$mainMod, Tab, workspace, previous"
      "Alt, Tab, workspace, previous"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      "$mainMod, comma, workspace, -1"
      "$mainMod, period, workspace, +1"

      # For some reason, this one doesn't work unless the main_mod one is also there? so weird...
      # hyper_mod contains the super button, so it's triggering the main_mod one. Need to use binds (not bind)
      # and use hyper_l rather than 
      "$mainMod, ${terminal_workspace_key}, ${terminal_workspace_cmd}"

      # ", Print, exec, grim -g \"$(slurp -d)\" - | wl-copy"
      ", Print, exec, grim -g \"$(slurp -d)\" -" # Saves to to the screenshot folder `~/Pictures/screenshots/`
    ];
  };
}