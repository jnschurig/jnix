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
    # github-desktop
    kitty
    openssl
    neovim
    # vscode

    # CLI utils
    brightnessctl # Screen Brightness Control
    # framework-tool # rust-based framework tooling. Doesn't seem to work for some reason...
    # fw-ectool
    git
    inxi # Show devices
    lazygit
    neofetch
    pamixer # Audio control
    pavucontrol # Audio control app
    playerctl # Media player controls
    # sway
    # swayimg
    unzip
    wget
    zip

    # Desktop Apps
    # audacity # Don't need this for now.
    # audacious
    # chromium
    # discord
    # discord-ptb
    # obsidian
    # vivaldi # Run using this command until further notice: vivaldi --disable-features=AllowQt

    # Gaming
    lutris
    # retroarch
    # (retroarch.override {
    #   cores = with libretro; [
    #     # genesis-plus-gx
    #     snes9x
    #     # beetle-psx-hw
    #   ];
    # })
    steam
    # wine
    # wine-staging
    # wine-discord-ipc-bridge # Comes with nix gaming
    # winetricks
    # protontricks

    # Wayland
    wev # Event viewer. Very helpful for figuring out key mapping
    xwayland
    xwaylandvideobridge

    # GPU
    amdvlk
    gpu-viewer
    vulkan-tools

    # Window Management
    grim
    hyprland
    hyprlock
    # (callPackage ./modules/sddm_eucalyptus_drop.nix) # import a theme, but it's not working quite yet.
    kdePackages.qt6ct
    # kdePackages.qtsvg
    libsForQt5.qt5ct
    libnotify
    # nwg-look
    mako # notifications
    networkmanagerapplet
    rofi-wayland
    # sddm-kcm
    slurp
    waybar
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"];
      })
    )
    wireplumber
    wl-clipboard-rs
    # wmctrl
    xdg-desktop-portal-hyprland

    # Other
    home-manager
    samba
    libgcc
    # gcc-unwrapped
    # libsForQt5.qtstyleplugin-kvantum
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