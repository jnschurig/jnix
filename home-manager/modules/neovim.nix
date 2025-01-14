{
  # programs.nixvim = {
  #   enable = true;

  #   colorschemes.catppuccin.enable = true;
  #   plugins.lualine.enable = true;
  # };

  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };

}
