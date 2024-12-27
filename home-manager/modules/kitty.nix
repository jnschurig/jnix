{
  # programs.kitty = {
  #   enable = true;
  #   # font = {
  #   #  name = pks.firacode;
  #   #  size = 10;
  #   # };
  #   shellIntegration = {
  #     enableZshIntegration = true;
  #   };
  #   # theme = "Gruvbox Material Dark Medium";
  #   extraConfig = builtins.readFile ./kitty/kitty.conf;
  # };

  # Because kitty uses gpu stuff, and nix can't handle gpu stuff
  # with home-manager only, just put the config file there and 
  # install kitty separately.

  home.file.".config/kitty/kitty.conf" = {
    source = ./kitty/kitty.conf;
    # executable = true;
  };
}
