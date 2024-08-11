{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/git/jnix";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      hms = "home-manager switch --flake ${flakeDir}";
      ncg = "sudo nix-collect-garbage -d";

      conf = "nvim ${flakeDir}/nixos/configuration.nix";
      pkgs = "nvim ${flakeDir}/nixos/packages.nix";

      ll = "ls -l";
      v = "nvim";
      se = "sudoedit";
      ff = "fastfetch";

      # python
      py = "python3";
      pip = "py -m pip";

      # Other
      fresh = "exec $SHELL";

      watts = "echo $(($(cat /sys/class/power_supply/BAT1/current_now) * $(cat /sys/class/power_supply/BAT1/voltage_now) / 1000000000000))W";
    };

    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
      # [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
      export PATH="$PYENV_ROOT/bin:$PATH"
      # eval "$(pyenv init -)"
      # source ${pkgs.pyenv}/share/zsh/site-functions/_pyenv
      # source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
      # source ${pkgs.zsh-autoenv}/share/zsh-autoenv/autoenv.zsh
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "colored-man-pages"
        "colorize"
        "direnv"
        "fzf"
        "git"
        "github"
        "pip"
        "python"
        "poetry"
        "pyenv"
        "rust"
        "sudo"
        "virtualenv"
        "zoxide"
      ];
      # theme = "agnoster"; # blinks is also really nice
    };

    prezto = {
      enable = true;
      python = {
        virtualenvInitialize = true;
        virtualenvAutoSwitch = true;
      };
    };

    plugins = [
      # not in nix
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    localVariables = {
      POWERLEVEL9K_CONFIG_FILE = [
        ./p10k-config/p10k.zsh
      ];
      POWERLEVEL9K_INSTANT_PROMPT = "quiet";
      TERM = "xterm-256color";
      BAT_THEME = "gruvbox-dark";
      # QMK_HOME = "${lib.makeBinPath pkgs.qmk_firmware}/..";
      ZSH_AUTOSUGGEST_USE_ASYNC = true;
      # ZSH_AUTOSUGGEST_STRATEGY = "(history match_prev_cmd)";
      LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc ]}";
    };

  };
}