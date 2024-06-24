{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    # permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  
    # Coding
    neovim
    vscode
    kitty
    openssl
    github-desktop

    # CLI utils
    git
    wget
    neofetch
    zip
    unzip

    # Desktop Apps
    audacity
    chromium
    discord
    # firefox # already enabled in configuration.nix?
    obsidian
    # ulauncher
    vivaldi # Run using this command until further noticevivaldi --disable-features=AllowQt

    # Wayland
    xwayland

    # GPU
    amdvlk

    # Window Management
    # wmctrl

    # Other
    home-manager
    samba
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
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