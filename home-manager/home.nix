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

    file.".profile" = ''
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init --path)"
    '';

  };
}