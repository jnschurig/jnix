{ pkgs, ... }: {
  home = {
    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ-AA";
      size = 36;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
