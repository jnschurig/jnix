{ pkgs
, lib
, ...
}:

# let
#   isDarwin = builtins.elem pkgs.system [ "aarch64-darwin" ];
# in
{
  home.file = {
    # ".aerospace.toml".source = ./aerospace/aerospace.toml;
    # ".config/borders/bordersrc".source = ./aerospace/bordersrc;
    # ".taplo.toml".source = ./taplo/.taplo.toml;

    # ".hammerspoon" = {
    #   source = ./hammerspoon;
    #   recursive = true;
    # };

    # ".config/nvim/lua" = {
    #   source = ./neovim/lua;
    #   recursive = true;
    # };

    ".ssh/config" = {
      # source = if isDarwin then ./ssh/recharge_mac.config else ./ssh/personal.config;
      source = ./ssh/personal.config;
      target = ".ssh/config_source";
      onChange = ''
        cat ~/.ssh/config_source > ~/.ssh/config && chmod 400 ~/.ssh/config
      '';
    };

  };

  home.packages = with pkgs; [
    # coreutils
    # nmap
    # yq-go # yaml processor
    fzf # fuzzy finder
    # fd # fuzzy rust-based find replacement
    fzf-git-sh # fuzzy git search and tools
    shellcheck
    # hadolint
    # yamllint
    # lazydocker
    # taplo

    # hobbies

    # Git
    pre-commit

    # Base deps
    # file
    # which
    # tree
    # gnused # linux sed

    # i can never get this to work
    # any time i enable it, it completely blocks me from being able to type in the terminal
    # I figured it out, you have to remove all compinit calls from your zshrc
    # ! MAKE SURE programs.zsh.enableCompletion IS SET TO FALSE BEFORE ENABLING THIS
    # ! YOU WILL NOT BE ABLE TO TYPE ANYTHING IN THE SHELL IF YOU DON'T
    # zsh-autocomplete
    # TODO: maybe i can use some cool nix magic to only let this be installed if
    # TODO: enableCompletion is set to false
    zsh-fast-syntax-highlighting
    zsh-completions
    zsh-autoenv

    # productivity
    # glow # markdown previewer in terminal

    # work
    # kubectl
    # kubectx
    # krew # i cant really tell whether this works, then command `krew` works but `kubectl krew` doesn't
    # google-cloud-sdk # can't install in nix because it blocks `gcloud components install`
    # helm # only supported on linux, installing through homebrew
    # helmfile
    # postgresql_14

    # Python build dependencies
    openssl
    # readline
    # xz
    # zlib
    # not in nix, but still needed, moved to brew
    # sqlite3
    # tcl-tk
    ####################

    ## Had some issues with poetry install locally so manually installed instead
    # poetry
  ]
  # MAC ONLY
  # ++ lib.optionals isDarwin [
  #   monitorcontrol # manage lg monitor volume and display
  #   # work
  #   vault
  # ]
  # ++ lib.optionals (!isDarwin) [
  #   ripgrep # rust grep (installed system-wide)
  #   jq # json processor (installed system-wide)
  #   unzip # unzip not included in ubuntu and needed for stylua
  #   go # sqls
  #   docker # containers for home server (pi)
  # ]
  ;

  programs = {

    # neovim = import ./neovim/neovim.nix {
    #   inherit pkgs;
    #   inherit lib;
    # };

    # tmux = import ./tmux/tmux.nix { inherit pkgs; };

    kitty = import ./modules/kitty.nix {
      inherit pkgs;
      inherit lib;
    };

    # mise = {
    #   enable = true;
    #   enableZshIntegration = true;
    # };

    # direnv = {
    #   enable = true;
    #   enableZshIntegration = true;
    # };

    # fzf = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
    #   changeDirWidgetOptions = [
    #     ''--preview "bat --color=always --style=numbers --line-range=:500 {}"''
    #   ];
    # };

    # ruff = {
    #   enable = true;
    #   settings = {
    #     line-length = 120;
    #     # per-file-ignores = { };
    #     # lint = {
    #     #   select = [ ];
    #     #   ignore = [ ];
    #   };
    # };

    # eza = {
    #   enable = true;
    #   # enableAliases = true;
    #   git = true;
    #   icons = true;
    # };

    # vscode = lib.optionalAttrs (isDarwin) {
    #   enable = true;
    #   package = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
    #     src = builtins.fetchTarball {
    #       url = "https://update.code.visualstudio.com/latest/darwin-arm64/insider";
    #       sha256 = "0jkcvn2xmb5wqdc3wd9kwyvwkqkaqv4x5ln44smbxkcyi9b0sf4g";
    #     };
    #     version = "latest";
    #   });
    # };

    # bat = {
    #   enable = true;
    #   extraPackages = with pkgs.bat-extras; [
    #     batdiff
    #     batgrep
    #     batman
    #     batwatch
    #     prettybat
    #   ];
    #   config = {
    #     theme = "gruvbox-dark";
    #     style = "numbers,changes,header,grid";
    #   };

    # };

    # lazygit = {
    #   enable = true;
    #   settings = {
    #     gui = {
    #       nerdFontsVersion = 3;
    #     };
    #     git = {
    #       paging = {
    #         pager = "delta --syntax-theme gruvbox-dark --paging=never";
    #       };
    #     };
    #   };
    # };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    # zoxide = {
    #   enable = true;
    #   enableZshIntegration = true;
    # };

    # pyenv.enable = true;

    # jq.enable = true;

    nix-index.enable = true;

    # oh-my-posh = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   settings = builtins.readFile ./ohmyposh/modern-gruvbox.omp.json;
    # };

  };
}