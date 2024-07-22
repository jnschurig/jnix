let
  image_1 = "~/Pictures/wallpaper/background/dark_tree.png";
  image_2 = "~/Pictures/wallpaper/background/shell_frieze.jpeg";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      splash_offset = 2.0;

      preload =
        [
          "${image_1}"
          # "${image_2}"
        ];

      wallpaper = [
          ",${image_1}"
          ",${image_2}"
      ];
    };
  };
}
