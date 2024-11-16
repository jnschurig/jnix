{ pkgs
, lib
, ...
}:

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
    file
    fzf # fuzzy finder
    fd # fuzzy rust-based find replacement
    fzf-git-sh # fuzzy git search and tools
    jq
    # kitty
    # lazydocker
    ripgrep
    ripgrep-all
    shellcheck
    # taplo
    tree
    unzip
    wget
    which
    zip

    # programming
    # pylyzer
    # ruff
    # uv
    # With UV, you need to install python first, then it can use it.
    # python312

    # hobbies
    # lumafly
    # shipwright
    # _2ship2harkinian
    # snipes # Crazy that this exists as a package.

    # Media
    # bk # rust cli epub reader
    # drawio
    # ffmpeg_7
    # koodo-reader
    # mpv # Media player
    # mpvc # Similar to MPV, but with controls
    # obs-studio
    # tartube-yt-dlp
    # transmission-gtk
    # vlc
    # yt-dlp

    # Base deps
    # yazi # rust file manager
    # gnused # linux sed

    zsh-fast-syntax-highlighting
    zsh-completions
    zsh-autoenv
    zsh-prezto

    # productivity
    # glow # markdown previewer in terminal
  ];

  programs = {

    # neovim = import .modules/neovim/neovim.nix {
    #   inherit pkgs;
    #   inherit lib;
    # };

    # tmux = import ./tmux/tmux.nix { inherit pkgs; };

    # kitty = import ./modules/kitty.nix {
    #   inherit pkgs;
    #   inherit lib;
    # };

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

    # poetry.enable = true;

  };

  # fonts.packages = with pkgs; [
  #   jetbrains-mono
  #   noto-fonts
  #   noto-fonts-emoji
  #   twemoji-color-font
  #   font-awesome
  #   powerline-fonts
  #   powerline-symbols
  #   (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  # ];
}
