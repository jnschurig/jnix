{ pkgs
, lib
, ...
}: {
  imports = [
    ./fzf.nix
    ./ghostty.nix
    ./git.nix
    # ./lazygit.nix # DEPRECATED
    ./helix.nix
    ./kitty.nix
    ./neovim.nix
    # ./nixvim.nix # DEPRECATED
    ./pycodestyle.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix

    # WM/DE
    ./hyprland.nix
    ./mako.nix
    ./rofi.nix
    ./waybar.nix

    # DEPRECATED
    # ./wms/hypridle.nix
    # ./wms/hyprland.nix
    # ./wms/hyprlock.nix
    # ./wms/hyprpaper.nix
    # ./wms/waybar.nix
    # ./wms/wms_scripts.nix
  ];
}
