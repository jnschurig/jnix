{ pkgs
, lib
, ...
}: {
  imports = [
    ./fzf.nix
    ./ghostty.nix
    ./git.nix
    ./lazygit.nix
    ./kitty.nix
    ./nixvim.nix
    ./rofi.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix

    # ./wms/hypridle.nix
    # ./wms/hyprland.nix
    # ./wms/hyprlock.nix
    # ./wms/hyprpaper.nix
    # ./wms/waybar.nix
    # ./wms/wms_scripts.nix
  ];
}
