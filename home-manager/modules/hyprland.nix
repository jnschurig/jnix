{ pkgs
, lib
, ...
}: {
  home = {
    file = {
      ".config/hypr/hyprland.conf" = {
        source = ./hyprland/hyprland.conf;
      };
    };

    file = {
      ".config/hypr/config" = {
        source = ./hyprland/config;
        recursive = true;
      };
    };

    file = {
      ".config/hypr/scripts" = {
        source = ./hyprland/scripts;
        recursive = true;
        executable = true;
      };
    };
  };
}
