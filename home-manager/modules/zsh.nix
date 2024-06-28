{ lib
, pkgs
, ...
}: { config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # This one can be problematic
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
   
    # Trying out removing this.
    # syntaxHighlighting.enable = true;

    # shellAliases =
    #   let
    #     flakeDir = "~/nix";
    #   in {
    #   rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
    #   upd = "nix flake update ${flakeDir}";
    #   upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

    #   hms = "home-manager switch --flake ${flakeDir}";

    #   conf = "nvim ${flakeDir}/nixos/configuration.nix";
    #   pkgs = "nvim ${flakeDir}/nixos/packages.nix";

    #   ll = "ls -l";
    #   v = "nvim";
    #   se = "sudoedit";
    #   ff = "fastfetch";
    # };

    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
      ignoreAllDups = true;
      # path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtraFirst = ''
      # source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';

    shellAliases = import ./shell/aliases.nix;

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
        name = "zsh-extra";
        src = ./zsh;
        file = "extra.zsh";
      }
    ];

    localVariables = {
      POWERLEVEL9K_CONFIG_FILE = [
        # ./p10k-config/zsh-theme-gruvbox-material-dark.zsh
        ./p10k-config/p10k.zsh
      ];
      POWERLEVEL9K_INSTANT_PROMPT = "quiet";
      TERM = "xterm-256color";
      BAT_THEME = "gruvbox-dark";
      # QMK_HOME = "${lib.makeBinPath pkgs.qmk_firmware}/..";
      ZSH_AUTOSUGGEST_USE_ASYNC = true;
      # ZSH_AUTOSUGGEST_STRATEGY = "(history match_prev_cmd)";

      # work only
      # CLOUDSDK_PYTHON = "${pkgs.python311}/bin/python";
      # VAULT_ADDR = "https://vault.infra.rechargeapps.net:443";
      # OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
      # INCLUDE_WORK_FUNCS = true;
    };

  };
}