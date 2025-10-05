{ pkgs
, lib
, ...
}: {
  imports = [
    # ./fzf.nix # Disabling since fzf is already installed via pacman
    # ./ghostty.nix
    # ./git.nix # Disabling for now in favor of testing alternate config
    # ./lazygit.nix # DEPRECATED
    # ./helix.nix
    # ./kitty.nix
    # ./neovim.nix
    # ./nixvim.nix # DEPRECATED
    # ./pycodestyle.nix # Not sure we need this...
    # ./tmux.nix
    ./zoxide.nix
    ./zsh.nix

    # WM/DE
    # ./hyprland.nix
    # ./mako.nix
    # ./rofi.nix
    # ./waybar.nix

    # DEPRECATED
    # ./wms/hypridle.nix
    # ./wms/hyprland.nix
    # ./wms/hyprlock.nix
    # ./wms/hyprpaper.nix
    # ./wms/waybar.nix
    # ./wms/wms_scripts.nix
  ];
}
