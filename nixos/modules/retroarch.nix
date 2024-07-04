{ pkgs
, lib
, ...
}: {
  programs.retroarch = {
    enable = true;
    override = {
      cores = with libretro {
        snes9x = true;
      };
    };
  };
}