{ pkgs
, lib
, ...
}: {
  imports = [
    ./fzf.nix
    ./git.nix
    ./python.nix
    ./shipwright.nix
    ./zoxide.nix
    ./zsh.nix
    # ./cursor.nix
    # ./htop.nix

    # ./wms/hyprland.nix
    # ./wms/waybar.nix
  ];
}