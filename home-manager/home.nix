let 
  profile_text = ''
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
  '';
in
{pkgs, ...}: {
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
      # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}";
    };

    file.".profile".text = "${profile_text}";
    file.".zprofile".text = "${profile_text}";

    # Put JNIX home manager in preferred location for full functionality.
    file.".config/home-manager" = {
      source = ../home-manager;
      recursive = true;
      executable = true;
    };

    # Associate JNIX nixos config with a "standard" home directory location.
    file."./nix/nixos" = {
      source = ../nixos;
      recursive = true;
      executable = true;
    };
  };
}