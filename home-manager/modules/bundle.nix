{ pkgs
, lib
, ...
}: {
  imports = [
    ./fzf.nix
    ./git.nix
    ./python.nix
    ./retroarch.nix
    ./zoxide.nix
    ./zsh.nix
    # ./cursor.nix
    # ./htop.nix

    # ./wms/hyprland.nix
    # ./wms/waybar.nix
  ];
}