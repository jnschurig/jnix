{ pkgs
, ...
}:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # nvidiaPatches = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland.
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    # OpenGL
    graphics.enable = true;

    # Most wayland compositors need this
    # nvidia.modesetting.enable = true;
  };

  # programs.xdg.portal = {
  #   enable = true;
  #   extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  #   # extraPortals = [pkgs.xdg-desktop-portal-gtk];
  # };
}

