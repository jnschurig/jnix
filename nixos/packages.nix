{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    # permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  
    # Coding
    devenv
    github-desktop
    kitty
    openssl
    neovim
    vscode

    # CLI utils
    git
    lazygit
    neofetch
    unzip
    wget
    zip

    # Desktop Apps
    audacity
    chromium
    discord
    obsidian
    vivaldi # Run using this command until further notice: vivaldi --disable-features=AllowQt

    # Gaming
    # retroarch
    (retroarch.override {
      cores = with libretro; [
        # genesis-plus-gx
        snes9x
        # beetle-psx-hw
      ];
    })
    # shipwright
    # _2ship2harkinian

    steam
    wine
    winetricks
    protontricks

    # Wayland
    xwayland

    # GPU
    amdvlk
    gpu-viewer
    vulkan-tools

    # Window Management
    hyprland
    # wmctrl

    # Other
    home-manager
    samba
    libgcc
    # gcc-unwrapped
    # libsForQt5.qtstyleplugin-kvantum
    # libsForQt5.qt5ct
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

}