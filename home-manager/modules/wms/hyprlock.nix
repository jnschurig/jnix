let
  text_color = "rgba(C9D3F5D9)";
  entry_border_color = "rgba(181926D9)";
  entry_background_color = "rgba(5B6078D9)";
  entry_color = "rgba(C9D3F5D9)";
  font_family = "Rubik Light";
  font_family_clock = "Rubik Light";
  font_material_symbols = "Material Symbols Rounded";
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 30;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          # path = "screenshot";
          # blur_passes = 3;
          # blur_size = 8;
          path = "~/Pictures/wallpaper/lock_screen/i_see_u_cat.jpg";
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "600, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "${entry_color}";
          inner_color = "${entry_background_color}";
          outer_color = "${entry_border_color}";
          # font_color = "rgb(202, 211, 245)";
          # inner_color = "rgb(91, 96, 120)";
          # outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "$USER";
          shadow_passes = 2;
        }
      ];

      label = [
        { # Clock
          # monitor = "";
          text = "$TIME";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "${text_color}";
          font_size = 65;
          # font_family = $font_family_clock

          position = "600, 300";
          halign = "center";
          valign = "center";
        }
      ];

    };
  };
}

# # $text_color = rgba(E3E1EFFF)
# # $entry_background_color = rgba(12131C11)
# # $entry_border_color = rgba(908F9F55)
# # $entry_color = rgba(C6C5D6FF)
# $text_color = rgba(FFFFFFFF)
# $entry_background_color = rgba(33333311)
# $entry_border_color = rgba(3B3B3B55)
# $entry_color = rgba(FFFFFFFF)
# $font_family = Rubik Light
# $font_family_clock = Rubik Light
# $font_material_symbols = Material Symbols Rounded

# background {
#     # color = rgba(0D0D17FF)
#     color = rgba(000000FF)
#     # path = {{ SWWW_WALL }}
#     # path = screenshot
#     # blur_size = 5
#     # blur_passes = 4
# }
# input-field {
#     monitor =
#     size = 250, 50
#     outline_thickness = 2
#     dots_size = 0.1
#     dots_spacing = 0.3
#     outer_color = $entry_border_color
#     inner_color = $entry_background_color
#     font_color = $entry_color
#     # fade_on_empty = true

#     position = 0, 20
#     halign = center
#     valign = center
# }

# label { # Clock
#     monitor =
#     text = $TIME
#     shadow_passes = 1
#     shadow_boost = 0.5
#     color = $text_color
#     font_size = 65
#     font_family = $font_family_clock

#     position = 0, 300
#     halign = center
#     valign = center
# }
# label { # Greeting
#     monitor =
#     text = hi $USER !!!
#     shadow_passes = 1
#     shadow_boost = 0.5
#     color = $text_color
#     font_size = 20
#     font_family = $font_family

#     position = 0, 240
#     halign = center
#     valign = center
# }
# label { # lock icon
#     monitor =
#     text = lock
#     shadow_passes = 1
#     shadow_boost = 0.5
#     color = $text_color
#     font_size = 21
#     font_family = $font_material_symbols

#     position = 0, 65
#     halign = center
#     valign = bottom
# }
# label { # "locked" text
#     monitor =
#     text = locked
#     shadow_passes = 1
#     shadow_boost = 0.5
#     color = $text_color
#     font_size = 14
#     font_family = $font_family

#     position = 0, 45
#     halign = center
#     valign = bottom
# }

# label { # Status
#     monitor =
#     text = cmd[update:5000] ~/.config/hypr/hyprlock/status.sh
#     shadow_passes = 1
#     shadow_boost = 0.5
#     color = $text_color
#     font_size = 14
#     font_family = $font_family

#     position = 30, -30
#     halign = left
#     valign = top
# }