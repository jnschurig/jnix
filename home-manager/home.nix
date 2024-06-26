{

  imports = [
    # ./zsh.nix
    ./modules/bundle.nix
    ./apps.nix
    # ./git.nix moved
  ];

  home-manager.backupFileExtension = "hm-backup";

  home = {
    username = "james";
    homeDirectory = "/home/james";
    stateVersion = "24.05";
  };
}