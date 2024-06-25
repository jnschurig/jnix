{

  imports = [
    # ./zsh.nix
    # ./modules/bundle.nix
    ./apps.nix
    ./git.nix
    ./qt.nix # originally added to try and make vivaldi run
  ];

  home = {
    username = "james";
    homeDirectory = "/home/james";
    stateVersion = "24.05";
  };
}