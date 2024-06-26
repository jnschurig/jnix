{ pkgs
, lib
, ...
}: {
  enable = true;
  #font = {
  #  name = pks.firacode;
  #  size = 16;
  #};
  shellIntegration = {
    enableZshIntegration = true;
  };
  # theme = "Gruvbox Material Dark Medium";
  extraConfig = builtins.readFile ./kitty/kitty.conf;
}