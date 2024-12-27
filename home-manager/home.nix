{pkgs, ...}: 
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
      # BROWSER = "firefox";
      EDITOR = "code";
      # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}";
      # NIX_CONF_DIR = "$HOME/.config/nix";
      PATH = "${pkgs.stdenv.shell}:$HOME/.bashrc:$(${pkgs.stdenv.shell} -c '/home/linuxbrew/.linuxbrew/bin/brew shellenv' | grep PATH | cut -d\"'\" -f2):$PATH";
      TERMINAL = "kitty";
    };

    # Put JNIX home manager in preferred location for full functionality.
    file = {
      ".config/home-manager" = {
        source = ../home-manager;
        recursive = true;
        executable = true;
      };

      ".ssh/config" = {
        # source = if isDarwin then ./ssh/mac.config else ./ssh/personal.config;
        source = ./ssh/personal.config;
        target = ".ssh/config_source";
        onChange = ''
          cat ~/.ssh/config_source > ~/.ssh/config && chmod 400 ~/.ssh/config
        '';
      };

      ".config/nix/nix.conf" = {
        source = ../nix.conf;
      };
    };

    # Associate JNIX nixos config with a "standard" home directory location.
    # file."./nix/nixos" = {
    #   source = ../nixos;
    #   recursive = true;
    #   executable = true;
    # };
  };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      xkb-options = ["caps:ctrl_modifier"];
    };
  };
}