{ pkgs
, lib
, ...
}:

{
  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    coreutils
    # nmap
    file
    fzf # fuzzy finder
    fd # fuzzy rust-based find replacement
    fzf-git-sh # fuzzy git search and tools
    jq
    # lazydocker
    neofetch
    ripgrep
    ripgrep-all
    shellcheck
    # taplo
    tmux
    tree
    unzip
    wget
    which
    wl-clipboard-rs
    zip

    # fonts
    font-awesome
    jetbrains-mono
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    powerline-fonts
    powerline-symbols
    twemoji-color-font

    # zsh stuff.
    zsh-fast-syntax-highlighting
    zsh-completions
    zsh-autoenv
    zsh-prezto

    # productivity
    # glow # markdown previewer in terminal
    rofi-wayland
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

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

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batwatch
        prettybat
      ];
      # config = {
      #   theme = "gruvbox-dark";
      #   style = "numbers,changes,header,grid";
      # };

    };


    jq.enable = true;

    nix-index.enable = true;

    # oh-my-posh = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   # settings = builtins.readFile ./ohmyposh/modern-gruvbox.omp.json;
    # };

  };
}
