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

}
