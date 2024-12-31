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
      ".config/hypr/scripts/gamemode.sh" = {
        source = ./hyprland/scripts/gamemode.sh;
        executable = true;
      };
    };
    file = {
      ".config/hypr/scripts/screenshot" = {
        source = ./hyprland/scripts/screenshot;
        executable = true;
      };
    };
    file = {
      ".config/hypr/scripts/screenshot_area" = {
        source = ./hyprland/scripts/screenshot_area;
        executable = true;
      };
    };
    file = {
      ".config/hypr/scripts/screenshot_full" = {
        source = ./hyprland/scripts/screenshot_full;
        executable = true;
      };
    };
  };
}
