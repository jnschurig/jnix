let 
  profile_text = ''
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
  '';
in
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

    file.".profile".text = "${profile_text}";
    file.".zprofile".text = "${profile_text}";

    file.".config/home-manager" = {
      source = ../home-manager;
      recursive = true;
      executable = true;
    };
    file.".nixos" = {
      source = ../nixos;
      recursive = true;
      executable = true;
    };
  };
}