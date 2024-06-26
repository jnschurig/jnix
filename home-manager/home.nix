{

  imports = [
    # ./zsh.nix
    ./modules/bundle.nix
    ./apps.nix
    # ./git.nix moved
  ];

  home = {
    username = "james";
    homeDirectory = "/home/james";
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "code";
      # BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };
}