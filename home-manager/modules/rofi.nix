{ pkgs
, lib
, ...
}: {
  home.file = {
    ".config/rofi/poweroff.sh" = {
      source = ./wms/scripts/poweroff.sh;
      executable = true;
    };

    ".config/rofi/rofi-power-menu.sh" = {
      source = ./wms/scripts/rofi-power-menu.sh;
      executable = true;
    };
  };

  # services.sxhkd = {
  #   enable = true;
  #   keybindings = {
  #     "super + space" = "pkill rofi || rofi -show drun -show-icons";
  #     "super + shift + P" = "~/.config/waybar/scripts/poweroff.sh";
  #   };
  # };

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>space";
      command = "pkill rofi || rofi -show drun -show-icons";
      name = "Rofi";
    };
  };


}
