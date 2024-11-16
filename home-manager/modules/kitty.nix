# { pkgs
# , lib
# , ...
# }: {
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
# }

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

  home.file.".config/kitty/kitty.conf" = {
    source = ./kitty/kitty.conf;
    # executable = true;
  };
}
