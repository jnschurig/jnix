{

  imports = [
    # ./zsh.nix
    # ./modules/bundle.nix
    ./apps.nix
    ./git.nix
    # QT added for vivaldi support...
    # ./qt.nix
  ];

  home = {
    username = "james";
    homeDirectory = "/home/james";
    stateVersion = "24.05";
  };
}