{

  imports = [
    # ./zsh.nix
    ./modules/bundle.nix
    ./apps.nix
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

    # Symlink my git jnix to the preferred home of nix
    file = {
      "~/nix/".source = /home/git/jnix;
    };
  };
}