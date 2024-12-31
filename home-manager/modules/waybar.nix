{ pkgs
, lib
, ...
}: {
  home = {
    file = {
      ".config/waybar" = {
        source = ./waybar;
        recursive = true;
        # executable = true;
      };
    };

    # file = {
    #   ".config/waybar/scripts/check_battery.sh" = {
    #     source = ./waybar/check_battery.sh;
    #     executable = true;
    #   };
    # };
  };
}
