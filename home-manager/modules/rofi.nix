{ pkgs
, lib
, ...
}: {
  home.file = {
    ".config/rofi/poweroff.sh" = {
      source = ./rofi/poweroff.sh;
      executable = true;
    };

    ".config/rofi/rofi-power-menu.sh" = {
      source = ./rofi/rofi-power-menu.sh;
      executable = true;
    };

    ".config/rofi/config.rasi" = {
      source = ./rofi/config.rasi;
    };
  };

  # services.sxhkd = {
  #   enable = true;
  #   keybindings = {
  #     "super + space" = "pkill rofi || rofi -show drun -show-icons";
  #     "super + shift + P" = "~/.config/waybar/scripts/poweroff.sh";
  #   };
  # };

  # A gnome setting. It didn't really work anyway...
  # dconf.settings = {
  #   "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
  #     binding = "<Super>space";
  #     command = "pkill rofi || rofi -show drun -show-icons";
  #     name = "Rofi";
  #   };
  # };


}
