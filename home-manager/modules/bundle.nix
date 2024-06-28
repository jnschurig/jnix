{ pkgs
, lib
, ...
}: {
  imports = [
    ./fzf.nix
    ./git.nix
    # moving to apps.nix
    ./kitty.nix
    ./zoxide.nix
    ./zsh.nix
    # ./cursor.nix
    # ./htop.nix
    # ./alacritty.nix

    # ./wms/hyprland.nix
    # ./wms/waybar.nix
  ];
}