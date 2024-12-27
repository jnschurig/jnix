{ config
, lib
, pkgs
, ...
}: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };

  home.file = {
    ".config/nvim" = {
      source = ./lazyvim;
      recursive = true;
    };
  };

}
