{ pkgs
, lib
, ...
}:

# let
#   isDarwin = builtins.elem pkgs.system [ "aarch64-darwin" ];
# in
{
  nixpkgs.config.allowUnfree = true;

  home.file = {
    # ".config/nvim/lua" = {
    #   source = ./neovim/lua;
    #   recursive = true;
    # };

    ".ssh/config" = {
      # source = if isDarwin then ./ssh/mac.config else ./ssh/personal.config;
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
    fd # fuzzy rust-based find replacement
    fzf-git-sh # fuzzy git search and tools
    jq
    ripgrep
    ripgrep-all
    shellcheck
    virtualenv
    # hadolint
    # yamllint
    # lazydocker
    # taplo

    # Other
    hyprpaper

    # hobbies
    ffmpeg_7
    mpv
    mpvc
    obs-studio
    shipwright
    _2ship2harkinian
    tartube-yt-dlp
    vlc
    yt-dlp

    # Git
    pre-commit

    # Base deps
    file
    which
    tree
    yazi # rust file manager
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
    zsh-prezto

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
    gcc
    gnumake
    # gcc-unwrapped
    # libgcc
    # cython
    # distlib?
    # isPyPy?
    poetry
    python3

    openssl
    readline
    xz
    zlib
  ];

  programs = {

    # neovim = import .modules/neovim/neovim.nix {
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

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

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

    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    jq.enable = true;

    nix-index.enable = true;

    # oh-my-posh = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   settings = builtins.readFile ./ohmyposh/modern-gruvbox.omp.json;
    # };

    poetry.enable = true;

  };
}